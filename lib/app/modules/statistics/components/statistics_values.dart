import 'package:flutter/material.dart';

class StatisticsValues extends StatelessWidget {
  final String matches;
  final String wins;
  final String longerSequence;
  final String currentSequence;

  const StatisticsValues({
    super.key,
    required this.matches,
    required this.wins,
    required this.longerSequence,
    required this.currentSequence,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          statisticValue('Partidas', matches, context),
          statisticValue('Vitórias', wins, context),
          statisticValue('Maior Sequência', longerSequence, context),
          statisticValue('Sequência Atual', currentSequence, context)
        ],
      ),
    );
  }

  SizedBox statisticValue(String name, String value, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.23,
      child: Column(children: [
        Text(
          value,
          style: const TextStyle(
              fontSize: 33, fontWeight: FontWeight.bold, height: 1.2),
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
              height: 1),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
