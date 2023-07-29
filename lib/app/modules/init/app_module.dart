import 'package:flutter_modular/flutter_modular.dart';
import 'package:wordle/app/modules/home/home_view.dart';
import 'package:wordle/app/modules/home/repositories/game_data_interface.dart';
import 'package:wordle/app/modules/home/repositories/game_data_repository.dart';
import 'package:wordle/app/modules/statistics/statistics_view.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IGameData>((i) => GameDataRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const HomeView()),
        ChildRoute('/statistics', child: (_, __) => const StatisticsView())
      ];
}
