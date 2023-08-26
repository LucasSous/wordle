import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wordle/app/modules/home/home_store.dart';
import 'package:wordle/app/widgets/text_box.dart';

class GridComponent extends StatelessWidget {
  final HomeStore homeStore;

  const GridComponent({super.key, required this.homeStore});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            homeStore.textBoxList.length,
            (index) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                homeStore.textBoxList[index].length,
                (idx) => TextBox(
                  digitAnimate: homeStore.digitAnimate,
                  errorAnimate: homeStore.activeRow == index
                      ? homeStore.errorAnimate
                      : false,
                  status: homeStore.textBoxList[index][idx].status,
                  letter: homeStore.textBoxList[index][idx].value,
                  selected: homeStore.activeBox == idx &&
                      homeStore.activeRow == index,
                  onTap: () {
                    homeStore.changeActiveBox(
                        idx, index == homeStore.activeRow);
                  },
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
