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
    var homeStore = widget.homeStore;
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyWidget(
                  character: 'Q',
                  color: bgColor('Q'),
                  onTap: () => homeStore.clickTheKey('Q')),
              KeyWidget(
                  character: 'W',
                  color: bgColor('W'),
                  onTap: () => homeStore.clickTheKey('W')),
              KeyWidget(
                  character: 'E',
                  color: bgColor('E'),
                  onTap: () => homeStore.clickTheKey('E')),
              KeyWidget(
                  character: 'R',
                  color: bgColor('R'),
                  onTap: () => homeStore.clickTheKey('R')),
              KeyWidget(
                  character: 'T',
                  color: bgColor('T'),
                  onTap: () => homeStore.clickTheKey('T')),
              KeyWidget(
                  character: 'Y',
                  color: bgColor('Y'),
                  onTap: () => homeStore.clickTheKey('Y')),
              KeyWidget(
                  character: 'U',
                  color: bgColor('U'),
                  onTap: () => homeStore.clickTheKey('U')),
              KeyWidget(
                  character: 'I',
                  color: bgColor('I'),
                  onTap: () => homeStore.clickTheKey('I')),
              KeyWidget(
                  character: 'O',
                  color: bgColor('O'),
                  onTap: () => homeStore.clickTheKey('O')),
              KeyWidget(
                  character: 'P',
                  color: bgColor('P'),
                  onTap: () => homeStore.clickTheKey('P')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyWidget(
                  character: 'A',
                  color: bgColor('A'),
                  onTap: () => homeStore.clickTheKey('A')),
              KeyWidget(
                  character: 'S',
                  color: bgColor('S'),
                  onTap: () => homeStore.clickTheKey('S')),
              KeyWidget(
                  character: 'D',
                  color: bgColor('D'),
                  onTap: () => homeStore.clickTheKey('D')),
              KeyWidget(
                  character: 'F',
                  color: bgColor('F'),
                  onTap: () => homeStore.clickTheKey('F')),
              KeyWidget(
                  character: 'G',
                  color: bgColor('G'),
                  onTap: () => homeStore.clickTheKey('G')),
              KeyWidget(
                  character: 'H',
                  color: bgColor('H'),
                  onTap: () => homeStore.clickTheKey('H')),
              KeyWidget(
                  character: 'J',
                  color: bgColor('J'),
                  onTap: () => homeStore.clickTheKey('J')),
              KeyWidget(
                  character: 'K',
                  color: bgColor('K'),
                  onTap: () => homeStore.clickTheKey('K')),
              KeyWidget(
                  character: 'L',
                  color: bgColor('L'),
                  onTap: () => homeStore.clickTheKey('L')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyWidget(
                  character: 'Z',
                  color: bgColor('Z'),
                  onTap: () => homeStore.clickTheKey('Z')),
              KeyWidget(
                  character: 'X',
                  color: bgColor('X'),
                  onTap: () => homeStore.clickTheKey('X')),
              KeyWidget(
                  character: 'C',
                  color: bgColor('C'),
                  onTap: () => homeStore.clickTheKey('C')),
              KeyWidget(
                  character: 'V',
                  color: bgColor('V'),
                  onTap: () => homeStore.clickTheKey('V')),
              KeyWidget(
                  character: 'B',
                  color: bgColor('B'),
                  onTap: () => homeStore.clickTheKey('B')),
              KeyWidget(
                  character: 'N',
                  color: bgColor('N'),
                  onTap: () => homeStore.clickTheKey('N')),
              KeyWidget(
                  character: 'M',
                  color: bgColor('M'),
                  onTap: () => homeStore.clickTheKey('M')),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: homeStore.clickDeleteKey,
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
