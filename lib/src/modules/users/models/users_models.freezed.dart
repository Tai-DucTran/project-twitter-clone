// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isCreator => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  String? get coverPic => throw _privateConstructorUsedError;
  DateTime? get birthOfDate => throw _privateConstructorUsedError;
  String? get intro => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String email,
      String userName,
      String phoneNumber,
      DateTime createdAt,
      bool isCreator,
      String? location,
      String? gender,
      String? profilePic,
      String? coverPic,
      DateTime? birthOfDate,
      String? intro});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userName = null,
    Object? phoneNumber = null,
    Object? createdAt = null,
    Object? isCreator = null,
    Object? location = freezed,
    Object? gender = freezed,
    Object? profilePic = freezed,
    Object? coverPic = freezed,
    Object? birthOfDate = freezed,
    Object? intro = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCreator: null == isCreator
          ? _value.isCreator
          : isCreator // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      coverPic: freezed == coverPic
          ? _value.coverPic
          : coverPic // ignore: cast_nullable_to_non_nullable
              as String?,
      birthOfDate: freezed == birthOfDate
          ? _value.birthOfDate
          : birthOfDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      intro: freezed == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String userName,
      String phoneNumber,
      DateTime createdAt,
      bool isCreator,
      String? location,
      String? gender,
      String? profilePic,
      String? coverPic,
      DateTime? birthOfDate,
      String? intro});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userName = null,
    Object? phoneNumber = null,
    Object? createdAt = null,
    Object? isCreator = null,
    Object? location = freezed,
    Object? gender = freezed,
    Object? profilePic = freezed,
    Object? coverPic = freezed,
    Object? birthOfDate = freezed,
    Object? intro = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCreator: null == isCreator
          ? _value.isCreator
          : isCreator // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      coverPic: freezed == coverPic
          ? _value.coverPic
          : coverPic // ignore: cast_nullable_to_non_nullable
              as String?,
      birthOfDate: freezed == birthOfDate
          ? _value.birthOfDate
          : birthOfDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      intro: freezed == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      required this.email,
      required this.userName,
      required this.phoneNumber,
      required this.createdAt,
      this.isCreator = false,
      this.location,
      this.gender,
      this.profilePic,
      this.coverPic,
      this.birthOfDate,
      this.intro})
      : super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String userName;
  @override
  final String phoneNumber;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isCreator;
  @override
  final String? location;
  @override
  final String? gender;
  @override
  final String? profilePic;
  @override
  final String? coverPic;
  @override
  final DateTime? birthOfDate;
  @override
  final String? intro;

  @override
  String toString() {
    return 'User(id: $id, email: $email, userName: $userName, phoneNumber: $phoneNumber, createdAt: $createdAt, isCreator: $isCreator, location: $location, gender: $gender, profilePic: $profilePic, coverPic: $coverPic, birthOfDate: $birthOfDate, intro: $intro)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isCreator, isCreator) ||
                other.isCreator == isCreator) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.coverPic, coverPic) ||
                other.coverPic == coverPic) &&
            (identical(other.birthOfDate, birthOfDate) ||
                other.birthOfDate == birthOfDate) &&
            (identical(other.intro, intro) || other.intro == intro));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      userName,
      phoneNumber,
      createdAt,
      isCreator,
      location,
      gender,
      profilePic,
      coverPic,
      birthOfDate,
      intro);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      required final String email,
      required final String userName,
      required final String phoneNumber,
      required final DateTime createdAt,
      final bool isCreator,
      final String? location,
      final String? gender,
      final String? profilePic,
      final String? coverPic,
      final DateTime? birthOfDate,
      final String? intro}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get userName;
  @override
  String get phoneNumber;
  @override
  DateTime get createdAt;
  @override
  bool get isCreator;
  @override
  String? get location;
  @override
  String? get gender;
  @override
  String? get profilePic;
  @override
  String? get coverPic;
  @override
  DateTime? get birthOfDate;
  @override
  String? get intro;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
