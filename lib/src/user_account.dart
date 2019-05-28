// import 'package:graphened/graphened.dart';
import 'account_options.dart';
import 'authority.dart';
import 'graphene_object.dart';

import 'package:json_annotation/json_annotation.dart';
part 'user_account.g.dart';

@JsonSerializable()
class UserAccount extends GrapheneObject {
  static final String PROXY_TO_SELF = "1.2.5";
  String name;
  Authority owner;
  Authority active;
  AccountOptions options;
  String statistics;
  int membershipExpirationDate;
  String registrar;
  String referrer;
  String lifetimeReferrer;
  int networkFeePercentage;
  int lifetimeReferrerFeePercentage;
  int referrerRewardsPercentage;
  bool isLifeTime;

  UserAccount(
    String id, {
    this.name,
    this.owner,
    this.active,
    this.options,
    this.statistics,
    this.membershipExpirationDate,
    this.registrar,
    this.referrer,
    this.lifetimeReferrer,
    this.networkFeePercentage,
    this.lifetimeReferrerFeePercentage,
    this.referrerRewardsPercentage,
    this.isLifeTime,
    
  }) : super(id);

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);

  Map<String, dynamic> toJson() => _$UserAccountToJson(this);
}
