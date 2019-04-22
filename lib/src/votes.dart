import 'package:json_annotation/json_annotation.dart';
part 'votes.g.dart';

@JsonSerializable()
class Votes {
  Votes();
  factory Votes.fromJson(Map<String, dynamic> json) => _$VotesFromJson(json);
  Map<String, dynamic> toJson() => _$VotesToJson(this);
}
