import 'dart:async';

import 'package:hive/hive.dart';
import 'package:wordle/app/modules/home/models/game_data_model.dart';
import 'package:wordle/app/modules/home/repositories/game_data_interface.dart';
import 'package:wordle/app/shared/constants/boxes_constants.dart';

class GameDataRepository implements IGameData {
  final Completer<Box> _instance = Completer<Box>();

  _init() async {
    var box = await Hive.openBox(kGameData);
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
  Future<void> put(String key, GameDataModel object) async {
    var box = await _instance.future;
    await box.put(key, object);
  }
}
