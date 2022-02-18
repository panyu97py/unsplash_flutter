import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Links {
  Links({this.self, this.html, this.download, this.downloadLocation});

  String? self;

  String? html;

  String? download;

  String? downloadLocation;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
