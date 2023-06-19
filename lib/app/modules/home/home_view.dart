import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wordle/app/modules/home/components/keyboard_component.dart';
import 'package:wordle/app/modules/home/home_store.dart';
import 'package:wordle/app/widgets/button_widget.dart';
import 'package:wordle/app/widgets/text_box.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _homeStore = HomeStore();

  @override
  void initState() {
    _homeStore.randomWord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wordle',
          style: TextStyle(
              fontSize: 32,
              color: Color(0xff464646),
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.insert_chart_outlined,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                size: 30,
              ))
        ],
      ),
      body: Observer(builder: (_) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 25, left: 12, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  _homeStore.textBoxList.length,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _homeStore.textBoxList[index].length,
                      (idx) => TextBox(
                        digitAnimate: _homeStore.digitAnimate,
                        errorAnimate: _homeStore.activeRow == index
                            ? _homeStore.errorAnimate
                            : false,
                        color: _homeStore.textBoxList[index][idx].color,
                        letter: _homeStore.textBoxList[index][idx].value,
                        selected: _homeStore.activeBox == idx &&
                            _homeStore.activeRow == index,
                        onTap: () {
                          _homeStore.changeActiveBox(
                              idx, index == _homeStore.activeRow);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ButtonWidget(
                text: 'TENTAR',
                onPressed:
                    _homeStore.checkNotFilled(_homeStore.activeRow).isEmpty
                        ? () => _homeStore.checkWord(context)
                        : null,
              ),
              KeyboardComponent(
                homeStore: _homeStore,
              ),
            ],
          ),
        );
      }),
    );
  }
}
