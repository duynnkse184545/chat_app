import 'dart:convert';
import 'package:drift/drift.dart';

/// Converts List<String> to/from JSON string for SQLite storage
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    try {
      return List<String>.from(jsonDecode(fromDb));
    } catch (e) {
      return [];
    }
  }

  @override
  String toSql(List<String> value) {
    if (value.isEmpty) return '[]';
    return jsonEncode(value);
  }
}
