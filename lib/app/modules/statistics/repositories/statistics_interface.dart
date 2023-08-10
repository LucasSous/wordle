import 'package:wordle/app/modules/statistics/models/statistics_model.dart';

abstract class IStatistics {
  Future<StatisticsModel?> get(String key);
  Future<void> put(String key, StatisticsModel? object);
}
