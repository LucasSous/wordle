import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void snackbar({
  required BuildContext context,
  required String message,
  required AnimatedSnackBarType type,
  MultipleSnackBarStrategy snackBarStrategy = const ColumnSnackBarStrategy(),
}) {
  AnimatedSnackBar(
    mobileSnackBarPosition: MobileSnackBarPosition.top,
    duration: const Duration(seconds: 4),
    builder: ((context) => customSnackbar(type, message)),
  ).show(context);
}

Color? bgColor(AnimatedSnackBarType type) {
  switch (type) {
    case AnimatedSnackBarType.success:
      return const Color(0xFF85DF7D);
    case AnimatedSnackBarType.error:
      return const Color(0xFFFF8484);
    case AnimatedSnackBarType.warning:
      return const Color(0xFFFFE169);
    case AnimatedSnackBarType.info:
      return const Color(0xFF7ACAFF);
    default:
      return Colors.transparent;
  }
}

Color borderColor(AnimatedSnackBarType type) {
  switch (type) {
    case AnimatedSnackBarType.success:
      return const Color(0xFF48894A);
    case AnimatedSnackBarType.error:
      return const Color(0xFFC23131);
    case AnimatedSnackBarType.warning:
      return const Color(0xFFEAB456);
    case AnimatedSnackBarType.info:
      return const Color(0xFF098BE2);
    default:
      return Colors.transparent;
  }
}

IconData? returnIcon(AnimatedSnackBarType type) {
  switch (type) {
    case AnimatedSnackBarType.success:
      return Icons.check;
    case AnimatedSnackBarType.error:
      return Icons.close;
    case AnimatedSnackBarType.warning:
      return Icons.warning_amber_outlined;
    case AnimatedSnackBarType.info:
      return Icons.info_outline;
    default:
      return null;
  }
}

Widget customSnackbar(AnimatedSnackBarType type, String message) {
  return Container(
    decoration: BoxDecoration(
        color: bgColor(type),
        border: Border.all(color: borderColor(type)),
        borderRadius: BorderRadius.circular(6)),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: Row(
      children: [
        Icon(
          returnIcon(type),
          color: Colors.white,
          size: 32,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}
