import 'dart:convert';

import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/features/channel/data/models/channel_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChannelLocalDatasource {
  Future<void> cacheChannels(String serverId, List<ChannelModel> channels);

  Future<List<ChannelModel>> getCachedChannels(String serverId);

  Future<void> cacheChannel(ChannelModel channel);

  Future<ChannelModel?> getCachedChannel(String channelId);

  Future<void> clearCache();
}

class ChannelLocalDatasourceImpl implements ChannelLocalDatasource {
  final SharedPreferences _prefs;

  static const String _channelsPrefix = 'CACHED_CHANNELS_';
  static const String _channelPrefix = 'CACHED_CHANNEL_';

  ChannelLocalDatasourceImpl({required SharedPreferences prefs})
    : _prefs = prefs;

  @override
  Future<void> cacheChannel(ChannelModel channel) async {
    try {
      final jsonString = json.encode(channel.toJson());
      await _prefs.setString('$_channelPrefix${channel.id}', jsonString);
    } catch (e) {
      throw CacheException('Failed to cache channel: $e');
    }
  }

  @override
  Future<void> cacheChannels(
    String serverId,
    List<ChannelModel> channels,
  ) async {
    try {
      final jsonList = channels.map((channel) => channel.toJson()).toList();
      final jsonString = json.encode(jsonList);
      await _prefs.setString('$_channelsPrefix$serverId', jsonString);
    } catch (e) {
      throw CacheException('Failed to cache channel list! $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final keys = _prefs.getKeys();
      for (final key in keys) {
        if (key.startsWith(_channelsPrefix) || key.startsWith(_channelPrefix)) {
          await _prefs.remove(key);
        }
      }
    } catch (e) {
      throw CacheException('Failed to clear cache: $e');
    }
  }

  @override
  Future<ChannelModel?> getCachedChannel(String channelId) async {
    try {
      final jsonString = _prefs.getString('$_channelPrefix$channelId');
      if (jsonString == null) return null;

      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return ChannelModel.fromJson(jsonMap);
    } catch (e) {
      throw CacheException('Failed to get cached channel: $e');
    }
  }

  @override
  Future<List<ChannelModel>> getCachedChannels(String serverId) async {
    try {
      final jsonString = _prefs.getString('$_channelPrefix$serverId');
      if (jsonString == null) return [];

      final jsonList = json.decode(jsonString) as List;
      return jsonList
          .map((json) => ChannelModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw CacheException('Failed to get cached channel list: $e');
    }
  }
}
