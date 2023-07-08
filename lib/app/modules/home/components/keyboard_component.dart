import 'package:flutter/material.dart';
import 'package:wordle/app/modules/home/home_store.dart';
import 'package:wordle/app/widgets/key_widget.dart';

class KeyboardComponent extends StatefulWidget {
  const KeyboardComponent({super.key, required this.homeStore});

  final HomeStore homeStore;

  @override
  State<KeyboardComponent> createState() => _KeyboardComponentState();
}

class _KeyboardComponentState extends State<KeyboardComponent> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          keysRow(0, 9),
          keysRow(10, 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              keysRow(19, 25),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: widget.homeStore.clickDeleteKey,
                child: const Icon(
                  Icons.backspace_rounded,
                  size: 35,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Row keysRow(int start, int end) {
    var startIndex = start - 1;
    var endIndex = end + 1;
    final letters = [
      'Q',
      'W',
      'E',
      'R',
      'T',
      'Y',
      'U',
      'I',
      'O',
      'P',
      'A',
      'S',
      'D',
      'F',
      'G',
      'H',
      'J',
      'K',
      'L',
      'Z',
      'X',
      'C',
      'V',
      'B',
      'N',
      'M'
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        letters.length,
        (index) {
          if (index > startIndex && index < endIndex) {
            return KeyWidget(
                character: letters[index],
                color: bgColor(letters[index]),
                onTap: () => widget.homeStore.clickTheKey(letters[index]));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Color bgColor(String character) {
    if (widget.homeStore.correctLetters.contains(character)) {
      return const Color(0xff85DF7D);
    } else if (widget.homeStore.nearbyLetters.contains(character)) {
      return const Color(0xFFFFECA9);
    } else if (widget.homeStore.incorrectLetters.contains(character)) {
      return const Color(0xffBEBEBE);
    } else {
      return Colors.white;
    }
  }
}
