import 'package:chat_app/core/utils/json_converters.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String uid,
    required String email,
    required String username,
    String? avatarUrl,
    @TimestampConverter() required DateTime createdAt,
    String? bio,
    @Default([]) List<String> serverIds,
    @Default([]) List<String> friendIds,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      username: username,
      avatarUrl: avatarUrl,
      createdAt: createdAt,
      bio: bio,
      serverIds: serverIds,
      friendIds: friendIds,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      email: entity.email,
      username: entity.username,
      avatarUrl: entity.avatarUrl,
      createdAt: entity.createdAt,
      bio: entity.bio,
      serverIds: entity.serverIds,
      friendIds: entity.friendIds,
    );
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    if (data == null) {
      throw Exception('User document data is null');
    }
    return UserModel.fromJson(data);
  }
}
