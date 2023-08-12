import 'dart:async';

import 'package:hive/hive.dart';
import 'package:wordle/app/shared/constants/hive_constants.dart';
import 'package:wordle/app/shared/enums/status_enum.dart';
import 'package:wordle/app/shared/interfaces/hive_interface.dart';
import 'package:wordle/app/shared/models/game_data_model.dart';
import 'package:wordle/app/shared/models/text_box_hive_model.dart';

class GameDataRepository implements IHive<GameDataModel> {
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
