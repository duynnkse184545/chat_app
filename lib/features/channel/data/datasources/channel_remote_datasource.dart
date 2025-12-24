import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/features/channel/data/models/channel_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChannelRemoteDataSource {
  Future<ChannelModel> createChannel({
    required String serverId,
    required String name,
    required String description,
  });

  Future<List<ChannelModel>> getServerChannels(String serverId);

  Future<ChannelModel> getChannel({
    required String serverId,
    required String channelId,
  });

  Future<void> updateChannel({
    required String serverId,
    required String channelId,
    String? name,
    String? description,
  });

  Future<void> deleteChannel({
    required String serverId,
    required String channelId,
  });
}

class ChannelRemoteDataSourceImpl implements ChannelRemoteDataSource {
  final FirebaseFirestore _firestore;

  ChannelRemoteDataSourceImpl({required FirebaseFirestore firestore})
    : _firestore = firestore;

  CollectionReference _channelsCollection(String serverId) {
    return _firestore
        .collection('servers')
        .doc(serverId)
        .collection('channels');
  }

  @override
  Future<ChannelModel> createChannel({
    required String serverId,
    required String name,
    required String description,
  }) async {
    try {
      final now = DateTime.now();
      final channelData = {
        'name': name,
        'description': description,
        'serverId': serverId,
        'createdAt': Timestamp.fromDate(now),
        'updatedAt': Timestamp.fromDate(now),
      };

      final docRef = await _channelsCollection(serverId).add(channelData);
      final doc = await docRef.get();
      return ChannelModel.fromFirestore(doc);
    } catch (e) {
      throw ServerException('Failed to create channel: $e');
    }
  }

  @override
  Future<void> deleteChannel({
    required String serverId,
    required String channelId,
  }) async {
    try {
      await _channelsCollection(serverId).doc().delete();
    } catch (e) {
      throw ServerException('Failed to delete channel: $e');
    }
  }

  @override
  Future<ChannelModel> getChannel({
    required String serverId,
    required String channelId,
  }) async {
    try {
      final doc = await _channelsCollection(serverId).doc(channelId).get();
      if (!doc.exists) {
        throw ServerException('Channel not found!');
      }

      return ChannelModel.fromFirestore(doc);
    } catch (e) {
      throw ServerException('Failed to get server $e');
    }
  }

  @override
  Future<List<ChannelModel>> getServerChannels(String serverId) async {
    try {
      final querySnapshot = await _channelsCollection(
        serverId,
      ).orderBy('createdAt', descending: true).get();

      return querySnapshot.docs
          .map((doc) => ChannelModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw ServerException('Failed to get server channels: $e');
    }
  }

  @override
  Future<void> updateChannel({
    required String serverId,
    required String channelId,
    String? name,
    String? description,
  }) async {
    try {
      final updateData = <String, dynamic>{
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      };

      if (name != null) updateData['name'] = name;
      if (description != null) updateData['description'] = description;

      await _channelsCollection(serverId).doc(channelId).update(updateData);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
