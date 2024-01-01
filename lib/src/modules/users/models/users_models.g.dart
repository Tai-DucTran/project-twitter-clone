// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      isCreator: json['isCreator'] as bool? ?? false,
      gender: json['gender'] as String?,
      profilePic: json['profilePic'] as String?,
      coverPic: json['coverPic'] as String?,
      birthOfDate: json['birthOfDate'] == null
          ? null
          : DateTime.parse(json['birthOfDate'] as String),
      intro: json['intro'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'isCreator': instance.isCreator,
      'gender': instance.gender,
      'profilePic': instance.profilePic,
      'coverPic': instance.coverPic,
      'birthOfDate': instance.birthOfDate?.toIso8601String(),
      'intro': instance.intro,
    };
