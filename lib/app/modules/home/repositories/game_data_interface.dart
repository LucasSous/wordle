import 'package:wordle/app/modules/home/models/game_data_model.dart';

abstract class IGameData {
  Future<GameDataModel?> get(String key);
  Future<void> put(String key, GameDataModel? object);
}
