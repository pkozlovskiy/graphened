import 'votes.dart';

import 'package:json_annotation/json_annotation.dart';
part 'account_options.g.dart';

@JsonSerializable()
class AccountOptions {
  final String memo_key;
  final String voting_account;
  final int num_witness;
  final int num_comittee;
  List<Votes> votes;
  // Extensions extensions;

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
