import 'package:json_annotation/json_annotation.dart';
part 'public_key.g.dart';

@JsonSerializable()
class PublicKey {
  PublicKey();
  factory PublicKey.fromJson(Map<String, dynamic> json) =>
      _$PublicKeyFromJson(json);

  Map<String, dynamic> toJson() => _$PublicKeyToJson(this);
}
