import 'package:flutter_modular/flutter_modular.dart';
import 'package:wordle/app/modules/home/home_view.dart';
import 'package:wordle/app/modules/splash_screen/splash_screen_view.dart';
import 'package:wordle/app/modules/statistics/statistics_view.dart';
import 'package:wordle/app/shared/interfaces/hive_interface.dart';
import 'package:wordle/app/shared/models/game_data_model.dart';
import 'package:wordle/app/shared/models/statistics_model.dart';
import 'package:wordle/app/shared/repositories/game_data_repository.dart';
import 'package:wordle/app/shared/repositories/statistics_repository.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IHive<GameDataModel>>((i) => GameDataRepository()),
        Bind<IHive<StatisticsModel>>((i) => StatisticsRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const SplashScreenView()),
        ChildRoute("/home", child: (_, __) => const HomeView()),
        ChildRoute('/statistics', child: (_, __) => const StatisticsView())
      ];
}
