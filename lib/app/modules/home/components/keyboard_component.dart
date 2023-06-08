import 'package:flutter/material.dart';
import 'package:wordle/app/widgets/key_widget.dart';

class KeyboardComponent extends StatefulWidget {
  const KeyboardComponent({super.key});

  @override
  State<KeyboardComponent> createState() => _KeyboardComponentState();
}

class _KeyboardComponentState extends State<KeyboardComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KeyWidget(character: 'Q'),
            KeyWidget(character: 'W'),
            KeyWidget(character: 'E'),
            KeyWidget(character: 'R'),
            KeyWidget(character: 'T'),
            KeyWidget(character: 'Y'),
            KeyWidget(character: 'U'),
            KeyWidget(character: 'I'),
            KeyWidget(character: 'O'),
            KeyWidget(character: 'P'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KeyWidget(character: 'A'),
            KeyWidget(character: 'S'),
            KeyWidget(character: 'D'),
            KeyWidget(character: 'F'),
            KeyWidget(character: 'G'),
            KeyWidget(character: 'H'),
            KeyWidget(character: 'J'),
            KeyWidget(character: 'K'),
            KeyWidget(character: 'L'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KeyWidget(character: 'Z'),
            KeyWidget(character: 'X'),
            KeyWidget(character: 'C'),
            KeyWidget(character: 'V'),
            KeyWidget(character: 'B'),
            KeyWidget(character: 'N'),
            KeyWidget(character: 'M'),
            SizedBox(width: 10),
            Icon(
              Icons.backspace_rounded,
              size: 30,
            )
          ],
        )
      ],
    );
  }
}
