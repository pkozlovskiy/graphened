import 'extensions.dart';
import 'public_key.dart';
import 'user_account.dart';
import 'votes.dart';

import 'package:json_annotation/json_annotation.dart';
part 'account_options.g.dart';

@JsonSerializable()
class AccountOptions {
  final PublicKey memo_key;
  final UserAccount voting_account;
  final int num_witness;
  final int num_comittee;
  List<Votes> votes;
  Extensions extensions;

  AccountOptions(
    this.memo_key,
    this.voting_account,
    this.num_witness,
    this.num_comittee,
  );

  @override
  int get hashCode => num_witness.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountOptions &&
          runtimeType == other.runtimeType &&
          num_witness == other.num_witness;

  factory AccountOptions.fromJson(Map<String, dynamic> json) =>
      _$AccountOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountOptionsToJson(this);
}
