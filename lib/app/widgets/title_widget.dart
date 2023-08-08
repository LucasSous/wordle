import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 32,
        color: Theme.of(context).textTheme.bodyLarge!.color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
