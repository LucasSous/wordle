import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:wordle/app/modules/home/models/text_box_hive_model.dart';

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
  bool finalized;

  @HiveField(4)
  List<String> correctLetters;

  @HiveField(5)
  List<String> incorrectLetters;

  @HiveField(6)
  List<String> nearbyLetters;

  GameDataModel({
    required this.words,
    required this.secretWord,
    required this.activeRow,
    required this.finalized,
    required this.correctLetters,
    required this.incorrectLetters,
    required this.nearbyLetters,
  });
}
