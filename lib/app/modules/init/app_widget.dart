import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: ((context) {
      return MaterialApp.router(
        title: 'Wordle',
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xffffffff),
            fontFamily: 'OpenSans',
            appBarTheme:
                const AppBarTheme(backgroundColor: Colors.white, elevation: 0)),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        debugShowCheckedModeBanner: false,
      );
    }));
  }
}
