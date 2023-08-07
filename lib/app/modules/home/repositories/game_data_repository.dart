import 'dart:async';

import 'package:hive/hive.dart';
import 'package:wordle/app/modules/home/enums/status_enum.dart';
import 'package:wordle/app/modules/home/models/game_data_model.dart';
import 'package:wordle/app/modules/home/models/text_box_hive_model.dart';
import 'package:wordle/app/modules/home/repositories/game_data_interface.dart';
import 'package:wordle/app/shared/constants/hive_constants.dart';

class GameDataRepository implements IGameData {
  final Completer<Box> _instance = Completer<Box>();

  Future<void> _init() async {
    Hive.registerAdapter<GameDataModel>(GameDataModelAdapter());
    Hive.registerAdapter<TextBoxHiveModel>(TextBoxHiveModelAdapter());
    Hive.registerAdapter<Status>(StatusAdapter());
    var box = await Hive.openBox<GameDataModel?>(kGameDataBox);
    _instance.complete(box);
  }

  GameDataRepository() {
    _init();
  }

  @override
  Future<GameDataModel?> get(String key) async {
    var box = await _instance.future;
    return await box.get(key);
  }

  @override
  Future<void> put(String key, GameDataModel? object) async {
    var box = await _instance.future;
    await box.put(key, object);
  }
}
