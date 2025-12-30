import 'package:chat_app/core/utils/json_converters.dart';
import 'package:chat_app/features/friends/domain/entities/friendship_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friendship_model.freezed.dart';
part 'friendship_model.g.dart';

@freezed
abstract class FriendshipModel with _$FriendshipModel {
  const FriendshipModel._();

  const factory FriendshipModel({
    required String userId,
    required String username,
    required String email,
    String? avatarUrl,
    String? bio,
    @TimestampConverter() required DateTime friendsSince,
  }) = _FriendshipModel;

  factory FriendshipModel.fromJson(Map<String, dynamic> json) =>
      _$FriendshipModelFromJson(json);

  FriendshipEntity toEntity() {
    return FriendshipEntity(
      userId: userId,
      username: username,
      email: email,
      avatarUrl: avatarUrl,
      bio: bio,
      friendsSince: friendsSince,
    );
  }
}