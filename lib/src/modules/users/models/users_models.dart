import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_models.freezed.dart';
part 'users_models.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String userName,
    required String phoneNumber,
    required DateTime createdAt,
    @Default(false) bool isCreator,
    String? location,
    String? gender,
    String? profilePic,
    String? coverPic,
    DateTime? birthOfDate,
    String? intro,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  const User._();
}
