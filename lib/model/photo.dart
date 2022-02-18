import 'package:unsplash_flutter/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Photo {

  Photo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.likes,
    required this.likedByUser,
    required this.description,
    required this.user,
  });

  String id;

  DateTime? createdAt;

  DateTime? updatedAt;

  int? width;

  int? height;

  String? color;

  String? blurHash;

  int? likes;

  bool? likedByUser;

  String? description;

  User user;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
