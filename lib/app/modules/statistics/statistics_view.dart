import 'package:flutter/material.dart';
import 'package:wordle/app/modules/statistics/components/chart.dart';
import 'package:wordle/app/modules/statistics/components/statistics_values.dart';
import 'package:wordle/app/widgets/button_widget.dart';
import 'package:wordle/app/widgets/title_widget.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleWidget(text: 'Estatísticas'),
        iconTheme: const IconThemeData(size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            StatisticsValues(
              matches: '25',
              wins: '25%',
              longerSequence: '25',
              currentSequence: '25',
            ),
            Chart(values: [12, 9, 30, 16, 0, 1]),
            ButtonWidget(text: 'RESETAR')
          ],
        ),
      ),
    );
  }
}
