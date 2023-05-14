import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({super.key, this.color, this.letter = ''});

  final Color? color;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: const Color(0xff8A8A8A)),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 30,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          letter.toUpperCase(),
          style: const TextStyle(fontSize: 32, color: Color(0xff5D5D5D)),
        ),
      ),
    );
  }
}
