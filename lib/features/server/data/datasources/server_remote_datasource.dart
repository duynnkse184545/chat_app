import 'package:chat_app/core/constants/firebase_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exceptions.dart';
import '../models/server_model.dart';

abstract class ServerRemoteDatasource {
  Future<ServerModel> createServer({
    required String name,
    required String description,
    String? iconUrl,
  });

  Future<List<ServerModel>> getUserServers();

  Future<ServerModel> getServer(String serverId);

  Future<void> updateServer({
    required String serverId,
    String? name,
    String? description,
    String? iconUrl,
  });

  Future<void> deleteServer(String serverId);

  Future<void> addMember({required String serverId, required String userId});

  Future<void> removeMember({required String serverId, required String userId});
}

class ServerRemoteDatasourceImpl implements ServerRemoteDatasource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ServerRemoteDatasourceImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  }) : _firestore = firestore,
       _auth = auth;

  CollectionReference get _servers =>
      _firestore.collection(FirebaseConstants.serversCollection);

  String get _currentUserId {
    final user = _auth.currentUser;
    if (user == null) throw ServerException('User not authenticated');
    return user.uid;
  }

  @override
  Future<void> addMember({
    required String serverId,
    required String userId,
  }) async {
    try {
      await _servers.doc(serverId).update({
        'memberIds': FieldValue.arrayUnion([userId]),
        'udpatedAt': Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      throw ServerException('Failed to add member: $e');
    }
  }

  @override
  Future<ServerModel> createServer({
    required String name,
    required String description,
    String? iconUrl,
  }) async {
    try {
      final userId = _currentUserId;
      final now = DateTime.now();

      final serverData = {
        'name': name,
        'description': description,
        'iconUrl': iconUrl,
        'ownerId': userId,
        'memberIds': [userId],
        'createdAt': Timestamp.fromDate(now),
        'updatedAt': Timestamp.fromDate(now),
      };

      final docRef = await _servers.add(serverData);
      final doc = await docRef.get();

      return ServerModel.fromFirestore(doc);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteServer(String serverId) async {
    try {
      await _servers.doc(serverId).delete();
    } catch (e) {
      throw ServerException('Failed to delete server: $e');
    }
  }

  @override
  Future<ServerModel> getServer(String serverId) async {
    try {
      final doc = await _servers.doc(serverId).get();
      if (!doc.exists) {
        throw ServerException('Server not found!');
      }

      return ServerModel.fromFirestore(doc);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ServerModel>> getUserServers() async {
    try {
      final userId = _currentUserId;
      final querySnapshot = await _servers
          .where('memberIds', arrayContains: userId)
          .orderBy('updatedAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => ServerModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> removeMember({
    required String serverId,
    required String userId,
  }) async {
    try {
      await _servers.doc(serverId).update({
        'memberIds': FieldValue.arrayRemove([userId]),
        'udpatedAt': Timestamp.fromDate(DateTime.now()),
      });
    } catch (e) {
      throw ServerException('Failed to remove member: $e');
    }
  }

  @override
  Future<void> updateServer({
    required String serverId,
    String? name,
    String? description,
    String? iconUrl,
  }) async {
    try{
      final updateData = <String, dynamic>{
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      };

      if (name != null) updateData['name'] = name;
      if (description != null) updateData['description'] = description;
      if (iconUrl != null) updateData['iconUrl'] = iconUrl;

      await _servers.doc(serverId).update(updateData);
      }catch(e) {
        throw(ServerException('Failed to update server: $e'));
      }
    }
}
