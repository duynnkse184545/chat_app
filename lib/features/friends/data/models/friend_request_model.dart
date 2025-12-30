import 'package:chat_app/core/utils/json_converters.dart';
import 'package:chat_app/features/friends/domain/entities/friend_request_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_request_model.freezed.dart';
part 'friend_request_model.g.dart';

@freezed
abstract class FriendRequestModel with _$FriendRequestModel {
  const FriendRequestModel._();

  const factory FriendRequestModel({
    required String requestId,
    required String fromUserId,
    required String fromUsername,
    required String toUserId,
    required String toUsername,
    required String status,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() DateTime? respondedAt,
  }) = _FriendRequestModel;

  factory FriendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestModelFromJson(json);

  factory FriendRequestModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FriendRequestModel.fromJson({
      'requestId': doc.id,
      ...data,
    });
  }

  Map<String, dynamic> toFirestore() {
    return {
      'fromUserId': fromUserId,
      'fromUsername': fromUsername,
      'toUserId': toUserId,
      'toUsername': toUsername,
      'status': status,
      'createdAt': Timestamp.fromDate(createdAt),
      'respondedAt': respondedAt != null ? Timestamp.fromDate(respondedAt!) : null,
    };
  }

  FriendRequestEntity toEntity() {
    return FriendRequestEntity(
      requestId: requestId,
      fromUserId: fromUserId,
      fromUsername: fromUsername,
      toUserId: toUserId,
      toUsername: toUsername,
      status: _parseStatus(status),
      createdAt: createdAt,
      respondedAt: respondedAt,
    );
  }

  FriendRequestStatus _parseStatus(String status) {
    return FriendRequestStatus.values.firstWhere(
          (e) => e.name == status,
      orElse: () => FriendRequestStatus.pending,
    );
  }
}