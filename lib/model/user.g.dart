// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String?,
      username: json['username'] as String?,
      profileImage: json['profile_image'] == null
          ? null
          : ProfileImage.fromJson(
              json['profile_image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'profile_image': instance.profileImage,
    };

ProfileImage _$ProfileImageFromJson(Map<String, dynamic> json) => ProfileImage(
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$ProfileImageToJson(ProfileImage instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };
