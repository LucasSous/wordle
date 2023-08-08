import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wordle/app/modules/home/components/grid_component.dart';
import 'package:wordle/app/modules/home/components/keyboard_component.dart';
import 'package:wordle/app/modules/home/home_store.dart';
import 'package:wordle/app/widgets/button_widget.dart';
import 'package:wordle/app/widgets/title_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _homeStore = HomeStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleWidget(text: 'Wordle'),
        leading: IconButton(
            onPressed: () {
              Modular.to.pushNamed('/statistics');
            },
            icon: const Icon(
              Icons.insert_chart_outlined,
              size: 35,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                size: 35,
              ))
        ],
      ),
      body: Observer(builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GridComponent(homeStore: _homeStore),
            ButtonWidget(
              text: _homeStore.finalized ? 'PRÓXIMO' : 'TENTAR',
              onPressed: _homeStore.checkNotFilled(_homeStore.activeRow).isEmpty
                  ? () => _clickButton()
                  : null,
            ),
            KeyboardComponent(
              homeStore: _homeStore,
            ),
          ],
        );
      }),
    );
  }

  void _clickButton() {
    _homeStore.finalized
        ? _homeStore.nextGame()
        : _homeStore.checkWord(context);
  }
}
