import 'package:json_annotation/json_annotation.dart';
part 'asset_options.g.dart';

@JsonSerializable()
class AssetOptions {
  AssetOptions();
  factory AssetOptions.fromJson(Map<String, dynamic> json) => _$AssetOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$AssetOptionsToJson(this);
}
