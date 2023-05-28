import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wordle/app/modules/home/home_store.dart';
import 'package:wordle/app/widgets/text_box.dart';

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
              Icons.auto_graph_outlined,
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
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              _homeStore.textBoxList.length,
              (index) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _homeStore.textBoxList[index].length,
                  (idx) => TextBox(
                    color: null,
                    letter: _homeStore.textBoxList[index][idx],
                    selected: _homeStore.activeBox == idx &&
                        _homeStore.activeRow == index,
                    onTap: () {
                      _homeStore.changeActiveBox(idx);
                      _homeStore.changeActiveRow(index);
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
