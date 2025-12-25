import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class MessageRemoteDatasource {
  Future<MessageModel> sendMessage({
    required String serverId,
    required String channelId,
    required String content,
  });

  Stream<List<MessageModel>> streamMessages({
    required String serverId,
    required String channelId,
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

  CollectionReference _messagesCollection({
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

  String get _currentUserId {
    final user = _auth.currentUser;
    if (user == null) throw ServerException('User not authenticated');
    return user.uid;
  }

  String get _currentUserName {
    final user = _auth.currentUser;
    if (user == null) throw ServerException('User not authenticated');
    return user.email ?? user.uid;
  }

  @override
  Future<MessageModel> sendMessage({
    required String serverId,
    required String channelId,
    required String content,
  }) async {
    try {
      final messageData = {
        'content': content,
        'senderId': _currentUserId,
        'senderName': _currentUserName,
        'channelId': channelId,
        'createdAt': Timestamp.fromDate(DateTime.now()),
      };

      final docRef = await _messagesCollection(
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
      return _messagesCollection(serverId: serverId, channelId: channelId)
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
}
