import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:wordle/app/shared/constants/hive_constants.dart';
import 'package:wordle/app/shared/interfaces/hive_interface.dart';
import 'package:wordle/app/shared/models/statistics_model.dart';
import 'package:wordle/app/shared/utils/dialog.dart';

part 'statistics_store.g.dart';

class StatisticsStore = StatisticsStoreBase with _$StatisticsStore;

abstract class StatisticsStoreBase with Store {
  final IHive<StatisticsModel> _statistics = Modular.get();

  @observable
  StatisticsModel? statistics;

  @observable
  bool isLoading = false;

  @action
  Future<void> getStatistics() async {
    var statistics = await _statistics.get(kStatisticsKey);
    this.statistics = statistics;
  }

  @action
  Future<void> resetStatistics() async {
    isLoading = true;
    await _statistics.put(kStatisticsKey, null);
    await getStatistics();
    isLoading = false;
  }

  void confirmResetStatistics(BuildContext context) {
    openDialog(
        context: context,
        title: 'Resetar Estatísticas',
        message: 'Todo o seu progresso será deletado!',
        buttonName: 'OK',
        clickButton: () async {
          await resetStatistics();
          Modular.to.pop();
        });
  }

  String returnMatches() {
    return statistics != null ? statistics!.numberOfMatches.toString() : '0';
  }

  String returnLongerSequence() {
    return statistics != null ? statistics!.longestSequence.toString() : '0';
  }

  String returnCurrentSequence() {
    return statistics != null ? statistics!.currentSequence.toString() : '0';
  }

  String returnWins() {
    if (statistics != null) {
      var percent =
          (statistics!.numberOfWins / statistics!.numberOfMatches) * 100;
      return '${percent.toStringAsFixed(0)}%';
    }
    return '0%';
  }

  List<int> handleChartValues(StatisticsModel? statistics) {
    List<int> list = [];

    for (var i = 0; i < 6; i++) {
      if (statistics != null) {
        list.add(statistics.attempts[i + 1]!);
      } else {
        list.add(0);
      }
    }

    return list;
  }
}
