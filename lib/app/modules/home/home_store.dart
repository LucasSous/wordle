import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:wordle/app/modules/home/models/text_box_model.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<ObservableList<TextBoxModel>> textBoxList =
      ObservableList<ObservableList<TextBoxModel>>.of(List.generate(
          6,
          (index) => ObservableList<TextBoxModel>.of(
              List.generate(5, (index) => TextBoxModel()))));

  @observable
  int activeBox = 0;

  @observable
  int activeRow = 0;

  @observable
  bool errorAnimate = false;

  @observable
  bool digitAnimate = false;

  @action
  void changeActiveBox(int value, bool isInRow) {
    if (isInRow) activeBox = value;
  }

  @action
  void changeActiveRow(int value) {
    activeRow = value;
  }

  List<int> checkNotFilled(int value) {
    List<int> list = [];
    for (var i = 0; i < 5; i++) {
      if (textBoxList[value][i].value.isEmpty) {
        list.add(i);
      }
    }
    return list;
  }

  @action
  void clickTheKey(String value) {
    textBoxList[activeRow][activeBox].value = value;
    digitAnimate = true;
    var listOfEmpties = checkNotFilled(activeRow);
    Timer(const Duration(milliseconds: 100), () {
      digitAnimate = false;
      if (listOfEmpties.isNotEmpty) {
        if (activeBox < 4) {
          activeBox += 1;
        } else {
          activeBox = listOfEmpties[0];
        }
      }
    });
  }

  @action
  void clickDeleteKey() {
    if (textBoxList[activeRow][activeBox].value.isEmpty) {
      activeBox = activeBox != 0 ? activeBox - 1 : activeBox;
    }
    textBoxList[activeRow][activeBox].value = '';
  }

  @action
  void checkWord() {
    var listOfEmpties = checkNotFilled(activeRow);
    setBoxColors();
    // startErrorAnimation();
    if (listOfEmpties.isEmpty) {
      activeRow += 1;
      activeBox = 0;
    }
  }

  @action
  void setBoxColors() {
    textBoxList[activeRow][0].color = Colors.red;
    Timer(const Duration(milliseconds: 300), () {
      textBoxList[activeRow][1].color = Colors.red;
      Timer(const Duration(milliseconds: 300), () {
        textBoxList[activeRow][2].color = Colors.red;
        Timer(const Duration(milliseconds: 300), () {
          textBoxList[activeRow][3].color = Colors.red;
          Timer(const Duration(milliseconds: 300), () {
            textBoxList[activeRow][4].color = Colors.red;
          });
        });
      });
    });
  }

  @action
  void startErrorAnimation() {
    errorAnimate = !errorAnimate;
  }
}
