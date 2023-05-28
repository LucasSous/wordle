import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wordle/app/shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: ((context) {
      return MaterialApp.router(
        title: 'Wordle',
        themeMode: ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        debugShowCheckedModeBanner: false,
      );
    }));
  }
}
