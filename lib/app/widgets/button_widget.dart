import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 45)),
          side: MaterialStateProperty.all(
              const BorderSide(color: Color(0xff8A8A8A)))),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
