import 'package:json_annotation/json_annotation.dart';

part 'urls.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Urls {

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  String? raw;

  String? full;

  String? regular;

  String? small;

  String? thumb;

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
