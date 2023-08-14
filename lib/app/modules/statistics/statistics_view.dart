import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wordle/app/modules/statistics/components/chart.dart';
import 'package:wordle/app/modules/statistics/components/statistics_values.dart';
import 'package:wordle/app/modules/statistics/statistics_store.dart';
import 'package:wordle/app/widgets/button_widget.dart';
import 'package:wordle/app/widgets/title_widget.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  final _statisticsStore = StatisticsStore();

  @override
  void initState() {
    _statisticsStore.getStatistics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleWidget(text: 'Estatísticas'),
        iconTheme: const IconThemeData(size: 30),
      ),
      body: Observer(builder: (_) {
        return _statisticsStore.isLoading
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StatisticsValues(
                      matches: _statisticsStore.returnMatches(),
                      wins: _statisticsStore.returnWins(),
                      longerSequence: _statisticsStore.returnLongerSequence(),
                      currentSequence: _statisticsStore.returnCurrentSequence(),
                    ),
                    Chart(
                        values: _statisticsStore
                            .handleChartValues(_statisticsStore.statistics)),
                    ButtonWidget(
                      text: 'RESETAR',
                      onPressed: _statisticsStore.statistics != null
                          ? () =>
                              _statisticsStore.confirmResetStatistics(context)
                          : null,
                    )
                  ],
                ),
              );
      }),
    );
  }
}
