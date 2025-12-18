import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:chat_app/core/error/exceptions.dart';
import 'package:chat_app/features/server/data/models/server_model.dart';

abstract class ServerLocalDatasource {
  Future<void> cacheServers(List<ServerModel> servers);

  Future<List<ServerModel>> getCachedServers();

  Future<void> cacheServer(ServerModel server);

  Future<ServerModel?> getCachedServer(String serverId);

  Future<void> clearCache();
}

class ServerLocalDatasourceImpl implements ServerLocalDatasource {
  final SharedPreferences _sharedPreferences;

  static const String _serversKey = 'CACHED_SERVERS';
  static const String _serverPrefix = 'CACHED_SERVER_';

  ServerLocalDatasourceImpl({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  @override
  Future<void> cacheServer(ServerModel server) async {
    try {
      final jsonString = json.encode(server.toJson());
      await _sharedPreferences.setString(
        '$_serverPrefix${server.serverId}',
        jsonString,
      );
    } catch (e) {
      throw CacheException('Failed to cache server: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheServers(List<ServerModel> servers) async {
    try {
      final jsonList = servers.map((server) => server.toJson()).toList();
      final jsonString = json.encode(jsonList);
      await _sharedPreferences.setString(_serversKey, jsonString);
    } catch (e) {
      throw CacheException('Failed to cache servers: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await _sharedPreferences.remove(_serversKey);

      final keys = _sharedPreferences.getKeys();
      for (final key in keys) {
        if (key.startsWith(_serverPrefix)) {
          await _sharedPreferences.remove(key);
        }
      }
    } catch (e) {
      throw CacheException('Failed to clear cache ${e.toString()}');
    }
  }

  @override
  Future<ServerModel?> getCachedServer(String serverId) async {
    try {
      final jsonString = _sharedPreferences.getString(
        '$_serverPrefix$serverId',
      );
      if (jsonString == null) return null;

      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return ServerModel.fromJson(jsonMap);
    } catch (e) {
      throw CacheException('Failed to get cached server: ${e.toString()}');
    }
  }

  @override
  Future<List<ServerModel>> getCachedServers() async {
    try {
      final jsonString = _sharedPreferences.getString(_serversKey);
      if (jsonString == null) return [];

      final jsonList = json.decode(jsonString) as List;
      return jsonList
          .map((json) => ServerModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw CacheException('Failed to get cached server list: ${e.toString()}');
    }
  }
}
