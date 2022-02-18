import 'package:json_annotation/json_annotation.dart';

part 'user_collection.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserCollection {
  UserCollection({required this.id});

  int id;

  String? title;

  DateTime? publishedAt;

  DateTime? lastCollectedAt;

  DateTime? updatedAt;

}
