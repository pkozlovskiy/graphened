import 'extensions.dart';
import 'package:json_annotation/json_annotation.dart';
part 'authority.g.dart';

@JsonSerializable()
class Authority {
  final int weight_threshold;
  // Map<UserAccount, int> account_auths;
  // Map<PublicKey, int> key_auths;
  final Extensions extensions;

  Authority(this.weight_threshold, this.extensions);



  @override
  int get hashCode => weight_threshold.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Authority &&
          runtimeType == other.runtimeType &&
          weight_threshold == other.weight_threshold;

  factory Authority.fromJson(Map<String, dynamic> json) =>
      _$AuthorityFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorityToJson(this);


}
