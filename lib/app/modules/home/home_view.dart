import 'package:flutter/material.dart';
import 'package:wordle/app/widgets/text_box.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wordle',
          style: TextStyle(fontSize: 32, color: Color(0xff464646)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TextBox(
                  color: Colors.white,
                  letter: 'A',
                ),
                SizedBox(width: 10),
                TextBox(
                  color: Colors.white,
                  letter: 'A',
                ),
                SizedBox(width: 10),
                TextBox(
                  color: Colors.white,
                  letter: 'A',
                ),
                SizedBox(width: 10),
                TextBox(
                  color: Colors.white,
                  letter: 'A',
                ),
                SizedBox(width: 10),
                TextBox(
                  color: Colors.white,
                  letter: 'A',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
