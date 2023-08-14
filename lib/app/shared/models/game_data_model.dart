import 'package:hive/hive.dart';
import 'package:wordle/app/shared/models/text_box_hive_model.dart';

part 'game_data_model.g.dart';

@HiveType(typeId: 0)
class GameDataModel extends HiveObject {
  @HiveField(0)
  final List<List<TextBoxHiveModel>> words;

  @HiveField(1)
  final String secretWord;

  @HiveField(2)
  final int activeRow;

  @HiveField(3)
  final bool finalized;

  @HiveField(4)
  final bool hasVictory;

  @HiveField(5)
  final List<String> correctLetters;

  @HiveField(6)
  final List<String> incorrectLetters;

  @HiveField(7)
  final List<String> nearbyLetters;

  GameDataModel({
    required this.words,
    required this.secretWord,
    required this.activeRow,
    required this.finalized,
    required this.hasVictory,
    required this.correctLetters,
    required this.incorrectLetters,
    required this.nearbyLetters,
  });
}
