import 'package:flutter_modular/flutter_modular.dart';
import 'package:wordle/app/modules/home/home_view.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => const HomeView()),
      ];
}
