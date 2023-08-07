import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordle/app/modules/init/app_module.dart';
import 'package:wordle/app/modules/init/app_widget.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Animate.restartOnHotReload = true;
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
