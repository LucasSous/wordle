import 'package:hive/hive.dart';
import 'package:wordle/app/modules/home/models/text_box_model.dart';

part 'game_data_model.g.dart';

@HiveType(typeId: 0)
class GameDataModel extends HiveObject {
  @HiveField(0)
  final List<TextBoxModel> words;

  @HiveField(1)
  final String secretWord;

  @HiveField(2)
  final int activeRow;

  GameDataModel({
    required this.words,
    required this.secretWord,
    required this.activeRow,
  });
}
