import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class MessageRemoteDatasource {
  // Channel Messages
  Future<MessageModel> sendMessage({
    required String serverId,
    required String channelId,
    required String content,
  });

  Stream<List<MessageModel>> streamMessages({
    required String serverId,
    required String channelId,
  });

  // Direct Messages
  Future<MessageModel> sendDirectMessage({
    required String conversationId,
    required String content,
  });

  Stream<List<MessageModel>> streamDirectMessages({
    required String conversationId,
  });
}

class MessageRemoteDatasourceImpl implements MessageRemoteDatasource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  MessageRemoteDatasourceImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  }) : _firestore = firestore,
       _auth = auth;

  // --- HELPERS ---

  CollectionReference _channelMessagesCollection({
    required String serverId,
    required String channelId,
  }) {
    return _firestore
        .collection('servers')
        .doc(serverId)
        .collection('channels')
        .doc(channelId)
        .collection('messages');
  }

  CollectionReference _dmMessagesCollection(String conversationId) {
    return _firestore
        .collection('conversations') // Assuming this is your DM collection
        .doc(conversationId)
        .collection('messages');
  }

  String get _currentUserId {
    final user = _auth.currentUser;
    if (user == null) throw ServerException('User not authenticated');
    return user.uid;
  }

  Future<String> get _currentUserName async {
    final user = _auth.currentUser;
    if (user == null) throw ServerException('User not authenticated');
    // Try to get updated name from Firestore user profile if possible, fallback to auth
    final doc = await _firestore.collection('users').doc(user.uid).get();
    if(doc.exists){
      return doc.data()?['username'] ?? user.email ?? user.uid;
    }
    return user.email ?? user.uid;
  }

  // --- IMPLEMENTATION ---

  @override
  Future<MessageModel> sendMessage({
    required String serverId,
    required String channelId,
    required String content,
  }) async {
    try {
      final senderName = await _currentUserName;
      final messageData = {
        'content': content,
        'senderId': _currentUserId,
        'senderName': senderName,
        'channelId': channelId,
        'createdAt': FieldValue.serverTimestamp(),
        'isDirectMessage': false, // Explicitly false
      };

      final docRef = await _channelMessagesCollection(
        serverId: serverId,
        channelId: channelId,
      ).add(messageData);
      
      final doc = await docRef.get();
      return MessageModel.fromFirestore(doc);
    } catch (e) {
      throw ServerException('Failed to send message: $e');
    }
  }

  @override
  Stream<List<MessageModel>> streamMessages({
    required String serverId,
    required String channelId,
  }) {
    try {
      return _channelMessagesCollection(serverId: serverId, channelId: channelId)
          .orderBy('createdAt', descending: false)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => MessageModel.fromFirestore(doc))
                .toList(),
          );
    } catch (e) {
      throw ServerException('Failed to stream message: $e');
    }
  }

  @override
  Future<MessageModel> sendDirectMessage({
    required String conversationId,
    required String content,
  }) async {
    try {
      debugPrint('🔵 Sending DM to: $conversationId');
      final senderName = await _currentUserName;
      
      final messageData = {
        'content': content,
        'senderId': _currentUserId,
        'senderName': senderName,
        'channelId': conversationId, // For DMs, channelId = conversationId
        'createdAt': FieldValue.serverTimestamp(),
        'isDirectMessage': true, // Explicitly true
      };

      // 1. Add Message
      final docRef = await _dmMessagesCollection(conversationId).add(messageData);

      // 2. Update Conversation Last Message (Important for list view)
      await _firestore.collection('conversations').doc(conversationId).update({
        'lastMessage': content,
        'lastMessageAt': FieldValue.serverTimestamp(),
      });

      final doc = await docRef.get();
      return MessageModel.fromFirestore(doc);
    } catch (e) {
       throw ServerException('Failed to send DM: $e');
    }
  }

  @override
  Stream<List<MessageModel>> streamDirectMessages({required String conversationId}) {
     try {
      return _dmMessagesCollection(conversationId)
          .orderBy('createdAt', descending: false)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => MessageModel.fromFirestore(doc))
                .toList(),
          );
    } catch (e) {
      throw ServerException('Failed to stream DMs: $e');
    }
  }
}