import 'package:flutter/material.dart';
import 'package:wordle/app/widgets/text_box.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int activeIndex = 0;
  List<String> row1 = ['', '', '', '', ''];

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: row1
                    .map(
                      (e) => Row(
                        children: [
                          TextBox(
                            color: null,
                            letter: e,
                            selected: false,
                          ),
                        ],
                      ),
                    )
                    .toList())
          ],
        ),
      ),
    );
  }
}
