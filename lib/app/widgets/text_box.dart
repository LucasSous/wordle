import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wordle/app/shared/enums/status_enum.dart';

class TextBox extends StatelessWidget {
  const TextBox(
      {super.key,
      this.status = Status.standard,
      this.letter = '',
      this.selected = false,
      this.digitAnimate = false,
      this.errorAnimate = false,
      this.onTap});

  final Status status;
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
          height: 55,
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor(status),
            border: Border.all(color: boderColor(), width: selected ? 2 : 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            letter.toUpperCase(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyLarge!.color,
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

  Color bgColor(Status status) {
    switch (status) {
      case Status.correct:
        return const Color(0xff85DF7D);
      case Status.incorrect:
        return const Color(0xffBEBEBE);
      case Status.near:
        return const Color(0xFFFFECA9);
      default:
        return Colors.white;
    }
  }
}
