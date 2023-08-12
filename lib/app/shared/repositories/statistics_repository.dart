import 'dart:async';

import 'package:hive/hive.dart';
import 'package:wordle/app/shared/constants/hive_constants.dart';
import 'package:wordle/app/shared/interfaces/hive_interface.dart';
import 'package:wordle/app/shared/models/statistics_model.dart';

class StatisticsRepository implements IHive<StatisticsModel> {
  final Completer<Box> _instance = Completer<Box>();

  Future<void> _init() async {
    Hive.registerAdapter<StatisticsModel>(StatisticsModelAdapter());
    var box = await Hive.openBox<StatisticsModel?>(kStatisticsBox);
    _instance.complete(box);
  }

  StatisticsRepository() {
    _init();
  }

  @override
  Future<StatisticsModel?> get(String key) async {
    var box = await _instance.future;
    return await box.get(key);
  }

  @override
  Future<void> put(String key, StatisticsModel? object) async {
    var box = await _instance.future;
    await box.put(key, object);
  }
}
