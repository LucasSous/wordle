import 'package:hive/hive.dart';

part 'statistics_model.g.dart';

@HiveType(typeId: 3)
class StatisticsModel extends HiveObject {
  @HiveField(0)
  final int numberOfMatches;

  @HiveField(1)
  final int numberOfWins;

  @HiveField(2)
  final int longestSequence;

  @HiveField(3)
  final int currentSequence;

  @HiveField(4)
  final Map<int, int> attempts;

  StatisticsModel({
    required this.numberOfMatches,
    required this.numberOfWins,
    required this.longestSequence,
    required this.currentSequence,
    required this.attempts,
  });
}
