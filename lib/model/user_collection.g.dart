// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCollection _$UserCollectionFromJson(Map<String, dynamic> json) =>
    UserCollection(
      id: json['id'] as int,
    )
      ..title = json['title'] as String?
      ..publishedAt = json['published_at'] == null
          ? null
          : DateTime.parse(json['published_at'] as String)
      ..lastCollectedAt = json['last_collected_at'] == null
          ? null
          : DateTime.parse(json['last_collected_at'] as String)
      ..updatedAt = json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String);

Map<String, dynamic> _$UserCollectionToJson(UserCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'published_at': instance.publishedAt?.toIso8601String(),
      'last_collected_at': instance.lastCollectedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
