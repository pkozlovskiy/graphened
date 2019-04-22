import 'package:json_annotation/json_annotation.dart';
part 'extensions.g.dart';

@JsonSerializable()
class Extensions {
  Extensions();

  factory Extensions.fromJson(Map<String, dynamic> json) =>
      _$ExtensionsFromJson(json);
  Map<String, dynamic> toJson() => _$ExtensionsToJson(this);
}
