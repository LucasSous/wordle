import 'package:flutter/material.dart';

class KeyWidget extends StatelessWidget {
  const KeyWidget({
    super.key,
    required this.character,
    this.color,
    this.onTap,
  });

  final String character;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Ink(
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.background,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(6),
          ),
          width: 35,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                character.toUpperCase(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
