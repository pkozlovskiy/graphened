import 'asset_options.dart';
import 'graphene_object.dart';

import 'package:json_annotation/json_annotation.dart';
part 'asset.g.dart';

@JsonSerializable()
class Asset extends GrapheneObject {
  String symbol;
  int precision = -1;
  String issuer;
  String description;
  String dynamic_asset_data_id;
  AssetOptions options;
  String bitasset_data_id;
  AssetType mAssetType;

  Asset(String id) : super(id);

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
  Map<String, dynamic> toJson() => _$AssetToJson(this);
}

enum AssetType {
  CORE_ASSET,
  UIA,
  SMART_COIN,
  PREDICTION_MARKET,
}
