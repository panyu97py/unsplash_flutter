import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  User({required this.id, this.name, this.username, this.profileImage});

  String id;

  String? name;

  String? username;

  ProfileImage? profileImage;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileImage {
  ProfileImage({this.small, this.medium, this.large});

  String? small;

  String? medium;

  String? large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => _$ProfileImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileImageToJson(this);
}
