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
                  character: 'Q', onTap: () => homeStore.clickTheKey('Q')),
              KeyWidget(
                  character: 'W', onTap: () => homeStore.clickTheKey('W')),
              KeyWidget(
                  character: 'E', onTap: () => homeStore.clickTheKey('E')),
              KeyWidget(
                  character: 'R', onTap: () => homeStore.clickTheKey('R')),
              KeyWidget(
                  character: 'T', onTap: () => homeStore.clickTheKey('T')),
              KeyWidget(
                  character: 'Y', onTap: () => homeStore.clickTheKey('Y')),
              KeyWidget(
                  character: 'U', onTap: () => homeStore.clickTheKey('U')),
              KeyWidget(
                  character: 'I', onTap: () => homeStore.clickTheKey('I')),
              KeyWidget(
                  character: 'O', onTap: () => homeStore.clickTheKey('O')),
              KeyWidget(
                  character: 'P', onTap: () => homeStore.clickTheKey('P')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyWidget(
                  character: 'A', onTap: () => homeStore.clickTheKey('A')),
              KeyWidget(
                  character: 'S', onTap: () => homeStore.clickTheKey('S')),
              KeyWidget(
                  character: 'D', onTap: () => homeStore.clickTheKey('D')),
              KeyWidget(
                  character: 'F', onTap: () => homeStore.clickTheKey('F')),
              KeyWidget(
                  character: 'G', onTap: () => homeStore.clickTheKey('G')),
              KeyWidget(
                  character: 'H', onTap: () => homeStore.clickTheKey('H')),
              KeyWidget(
                  character: 'J', onTap: () => homeStore.clickTheKey('J')),
              KeyWidget(
                  character: 'K', onTap: () => homeStore.clickTheKey('K')),
              KeyWidget(
                  character: 'L', onTap: () => homeStore.clickTheKey('L')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyWidget(
                  character: 'Z', onTap: () => homeStore.clickTheKey('Z')),
              KeyWidget(
                  character: 'X', onTap: () => homeStore.clickTheKey('X')),
              KeyWidget(
                  character: 'C', onTap: () => homeStore.clickTheKey('C')),
              KeyWidget(
                  character: 'V', onTap: () => homeStore.clickTheKey('V')),
              KeyWidget(
                  character: 'B', onTap: () => homeStore.clickTheKey('B')),
              KeyWidget(
                  character: 'N', onTap: () => homeStore.clickTheKey('N')),
              KeyWidget(
                  character: 'M', onTap: () => homeStore.clickTheKey('M')),
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
}
