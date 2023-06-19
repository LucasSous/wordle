import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TextBox extends StatelessWidget {
  const TextBox(
      {super.key,
      this.color,
      this.letter = '',
      this.selected = false,
      this.digitAnimate = false,
      this.errorAnimate = false,
      this.onTap});

  final Color? color;
  final String letter;
  final bool selected;
  final bool digitAnimate;
  final bool errorAnimate;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 55,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: boderColor(), width: selected ? 2 : 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Center(
              child: Text(
                letter.toUpperCase(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5D5D5D),
                ),
              ),
            ),
          ),
        )
            .animate(target: selected && digitAnimate ? 1 : 0)
            .scaleXY(
                duration: 150.ms, curve: Curves.easeInOut, begin: 1, end: 1.1)
            .then()
            .scaleXY(curve: Curves.easeInOut, begin: 1, end: 0.9)
            .animate(target: selected ? 1 : 0)
            .scaleXY(
                duration: 300.ms, curve: Curves.easeInOut, begin: 1, end: 1.1)
            .animate(target: errorAnimate ? 1 : 0)
            .shake(hz: 5, duration: 500.ms));
  }

  Color boderColor() {
    return selected ? Colors.black : const Color(0xff8A8A8A);
  }
}
