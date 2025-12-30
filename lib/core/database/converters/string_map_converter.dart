import 'dart:convert';
import 'package:drift/drift.dart';

/// Converts Map<String, String> to/from JSON string for SQLite storage
class StringMapConverter extends TypeConverter<Map<String, String>, String> {
  const StringMapConverter();

  @override
  Map<String, String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return {};
    try {
      return Map<String, String>.from(jsonDecode(fromDb));
    } catch (e) {
      return {};
    }
  }

  @override
  String toSql(Map<String, String> value) {
    if (value.isEmpty) return '{}';
    return jsonEncode(value);
  }
}
