import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox(
      {super.key,
      this.color,
      this.letter = '',
      this.selected = false,
      this.onTap});

  final Color? color;
  final String letter;
  final bool selected;
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
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.15),
          //     spreadRadius: 5,
          //     blurRadius: 30,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            letter.toUpperCase(),
            style: const TextStyle(fontSize: 32, color: Color(0xff5D5D5D)),
          ),
        ),
      ),
    );
  }

  Color boderColor() {
    return selected ? Colors.black : const Color(0xff8A8A8A);
  }
}
