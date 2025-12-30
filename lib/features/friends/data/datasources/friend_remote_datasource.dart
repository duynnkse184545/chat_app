import 'package:chat_app/core/constants/firebase_constants.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/friends/data/models/conversation_model.dart';
import 'package:chat_app/features/friends/data/models/friend_request_model.dart';
import 'package:chat_app/features/friends/data/models/friendship_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class FriendRemoteDatasource {
  Future<FriendRequestModel> sendFriendRequest({required String targetUsername});
  Future<void> acceptFriendRequest({required String requestId});
  Future<void> rejectFriendRequest({required String requestId});
  Stream<List<FriendRequestModel>> streamIncomingRequests();
  Stream<List<FriendRequestModel>> streamOutgoingRequests();
  Stream<List<FriendshipModel>> streamFriends();
  Future<void> removeFriend({required String friendId});
  Future<ConversationModel> getOrCreateConversation({required String friendId});
  Stream<List<ConversationModel>> streamConversations();
}

class FriendRemoteDatasourceImpl implements FriendRemoteDatasource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  FriendRemoteDatasourceImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _auth = auth;

  String get _currentUserId => _auth.currentUser!.uid;

  CollectionReference get _usersCollection =>
      _firestore.collection(FirebaseConstants.usersCollection);

  CollectionReference get _friendRequestsCollection =>
      _firestore.collection('friendRequests');

  CollectionReference get _conversationsCollection =>
      _firestore.collection('conversations');

  @override
  Future<FriendRequestModel> sendFriendRequest({
    required String targetUsername,
  }) async {
    debugPrint('🔵 [FriendRemoteDS] Sending friend request to: $targetUsername');

    // 1. Find target user by username
    final targetUserQuery = await _usersCollection
        .where('username', isEqualTo: targetUsername)
        .limit(1)
        .get();

    if (targetUserQuery.docs.isEmpty) {
      throw Exception('User not found with username: $targetUsername');
    }

    final targetUserDoc = targetUserQuery.docs.first;
    final targetUser = UserModel.fromFirestore(targetUserDoc);

    // 2. Check if trying to add self
    if (targetUser.uid == _currentUserId) {
      throw Exception('You cannot send a friend request to yourself');
    }

    // 3. Get current user data
    final currentUserDoc = await _usersCollection.doc(_currentUserId).get();
    final currentUser = UserModel.fromFirestore(currentUserDoc);

    // 4. Check if already friends
    if (currentUser.friendIds.contains(targetUser.uid)) {
      throw Exception('You are already friends with ${targetUser.username}');
    }

    // 5. Check for existing pending request
    final existingRequest = await _friendRequestsCollection
        .where('fromUserId', isEqualTo: _currentUserId)
        .where('toUserId', isEqualTo: targetUser.uid)
        .where('status', isEqualTo: 'pending')
        .limit(1)
        .get();

    if (existingRequest.docs.isNotEmpty) {
      throw Exception('You already have a pending request to ${targetUser.username}');
    }

    // 6. Check for reverse pending request
    final reverseRequest = await _friendRequestsCollection
        .where('fromUserId', isEqualTo: targetUser.uid)
        .where('toUserId', isEqualTo: _currentUserId)
        .where('status', isEqualTo: 'pending')
        .limit(1)
        .get();

    if (reverseRequest.docs.isNotEmpty) {
      throw Exception('${targetUser.username} has already sent you a friend request!');
    }

    // 7. Create friend request
    final requestData = {
      'fromUserId': _currentUserId,
      'fromUsername': currentUser.username,
      'toUserId': targetUser.uid,
      'toUsername': targetUser.username,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
      'respondedAt': null,
    };

    final docRef = await _friendRequestsCollection.add(requestData);
    final createdDoc = await docRef.get();

    debugPrint('✅ [FriendRemoteDS] Friend request created: ${docRef.id}');
    return FriendRequestModel.fromFirestore(createdDoc);
  }

  @override
  Future<void> acceptFriendRequest({required String requestId}) async {
    debugPrint('🔵 [FriendRemoteDS] Accepting friend request: $requestId');

    return _firestore.runTransaction((transaction) async {
      // 1. Get request
      final requestRef = _friendRequestsCollection.doc(requestId);
      final requestDoc = await transaction.get(requestRef);

      if (!requestDoc.exists) {
        throw Exception('Friend request not found');
      }

      final request = FriendRequestModel.fromFirestore(requestDoc);

      // 2. Verify current user is the recipient
      if (request.toUserId != _currentUserId) {
        throw Exception('You cannot accept this friend request');
      }

      // 3. Update request status
      transaction.update(requestRef, {
        'status': 'accepted',
        'respondedAt': FieldValue.serverTimestamp(),
      });

      // 4. Add to both users' friend lists
      final currentUserRef = _usersCollection.doc(_currentUserId);
      final friendUserRef = _usersCollection.doc(request.fromUserId);

      transaction.update(currentUserRef, {
        'friendIds': FieldValue.arrayUnion([request.fromUserId]),
      });

      transaction.update(friendUserRef, {
        'friendIds': FieldValue.arrayUnion([_currentUserId]),
      });

      debugPrint('✅ [FriendRemoteDS] Friend request accepted');
    });
  }

  @override
  Future<void> rejectFriendRequest({required String requestId}) async {
    debugPrint('🔵 [FriendRemoteDS] Rejecting friend request: $requestId');

    final requestDoc = await _friendRequestsCollection.doc(requestId).get();

    if (!requestDoc.exists) {
      throw Exception('Friend request not found');
    }

    final request = FriendRequestModel.fromFirestore(requestDoc);

    if (request.toUserId != _currentUserId) {
      throw Exception('You cannot reject this friend request');
    }

    await _friendRequestsCollection.doc(requestId).update({
      'status': 'rejected',
      'respondedAt': FieldValue.serverTimestamp(),
    });

    debugPrint('✅ [FriendRemoteDS] Friend request rejected');
  }

  @override
  Stream<List<FriendRequestModel>> streamIncomingRequests() {
    debugPrint('🔵 [FriendRemoteDS] Streaming incoming friend requests');

    return _friendRequestsCollection
        .where('toUserId', isEqualTo: _currentUserId)
        .where('status', isEqualTo: 'pending')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FriendRequestModel.fromFirestore(doc))
          .toList();
    });
  }

  @override
  Stream<List<FriendRequestModel>> streamOutgoingRequests() {
    debugPrint('🔵 [FriendRemoteDS] Streaming outgoing friend requests');

    return _friendRequestsCollection
        .where('fromUserId', isEqualTo: _currentUserId)
        .where('status', isEqualTo: 'pending')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FriendRequestModel.fromFirestore(doc))
          .toList();
    });
  }

  @override
  Stream<List<FriendshipModel>> streamFriends() async* {
    debugPrint('🔵 [FriendRemoteDS] Streaming friends list');

    await for (final userDoc in _usersCollection.doc(_currentUserId).snapshots()) {
      if (!userDoc.exists) {
        yield [];
        continue;
      }

      final currentUser = UserModel.fromFirestore(userDoc);
      final friendIds = currentUser.friendIds;

      if (friendIds.isEmpty) {
        yield [];
        continue;
      }

      // Fetch all friend user documents
      final friendDocs = await Future.wait(
        friendIds.map((friendId) => _usersCollection.doc(friendId).get()),
      );

      final friends = friendDocs.where((doc) => doc.exists).map((doc) {
        final user = UserModel.fromFirestore(doc);
        return FriendshipModel(
          userId: user.uid,
          username: user.username,
          email: user.email,
          avatarUrl: user.avatarUrl,
          bio: user.bio,
          friendsSince: user.createdAt,
        );
      }).toList();

      yield friends;
    }
  }

  @override
  Future<void> removeFriend({required String friendId}) async {
    debugPrint('🔵 [FriendRemoteDS] Removing friend: $friendId');

    return _firestore.runTransaction((transaction) async {
      final currentUserRef = _usersCollection.doc(_currentUserId);
      final friendUserRef = _usersCollection.doc(friendId);

      transaction.update(currentUserRef, {
        'friendIds': FieldValue.arrayRemove([friendId]),
      });

      transaction.update(friendUserRef, {
        'friendIds': FieldValue.arrayRemove([_currentUserId]),
      });

      debugPrint('✅ [FriendRemoteDS] Friend removed');
    });
  }

  @override
  Future<ConversationModel> getOrCreateConversation({
    required String friendId,
  }) async {
    debugPrint('🔵 [FriendRemoteDS] Getting/creating conversation with: $friendId');

    // Create consistent conversation ID (sorted user IDs)
    final userIds = [_currentUserId, friendId]..sort();
    final conversationId = '${userIds[0]}_${userIds[1]}';

    // Check if conversation exists
    final conversationDoc = await _conversationsCollection.doc(conversationId).get();

    if (conversationDoc.exists) {
      debugPrint('✅ [FriendRemoteDS] Conversation already exists');
      return ConversationModel.fromFirestore(conversationDoc);
    }

    // Get user data for both participants
    final currentUserDoc = await _usersCollection.doc(_currentUserId).get();
    final friendUserDoc = await _usersCollection.doc(friendId).get();

    final currentUser = UserModel.fromFirestore(currentUserDoc);
    final friendUser = UserModel.fromFirestore(friendUserDoc);

    // Create new conversation
    final conversationData = {
      'type': 'direct',
      'participantIds': [_currentUserId, friendId],
      'participantNames': {
        _currentUserId: currentUser.username,
        friendId: friendUser.username,
      },
      'lastMessage': null,
      'lastMessageAt': null,
      'createdAt': FieldValue.serverTimestamp(),
    };

    await _conversationsCollection.doc(conversationId).set(conversationData);
    final createdDoc = await _conversationsCollection.doc(conversationId).get();

    debugPrint('✅ [FriendRemoteDS] Conversation created');
    return ConversationModel.fromFirestore(createdDoc);
  }

  @override
  Stream<List<ConversationModel>> streamConversations() {
    debugPrint('🔵 [FriendRemoteDS] Streaming conversations');

    return _conversationsCollection
        .where('participantIds', arrayContains: _currentUserId)
        .orderBy('lastMessageAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ConversationModel.fromFirestore(doc))
          .toList();
    });
  }
}