import 'dart:async';
import 'dart:math';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:wordle/app/modules/home/models/text_box_model.dart';
import 'package:wordle/app/shared/utils/snackbar.dart';
import 'package:wordle/app/shared/wordlist/wordlist.dart';
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

  @observable
  String secretWord = '';

  @action
  void changeActiveBox(int value, bool isInRow) {
    if (isInRow) activeBox = value;
  }

  @action
  void changeActiveRow(int value) {
    activeRow = value;
  }

  @action
  void randomWord() {
    Random random = Random();
    int randomIndex = random.nextInt(wordlist.length);
    secretWord = wordlist[randomIndex];
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
    textBoxList[activeRow][activeBox].setValue(value);
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
    textBoxList[activeRow][activeBox].setValue('');
  }

  @action
  void checkWord(BuildContext context) {
    if (hasInTheList(formatWord(textBoxList[activeRow]))) {
      setBoxColors();
    } else {
      startErrorAnimation();
      snackbar(
          context: context,
          message: 'Ops, esta ai não contem na lista de palavras.',
          type: AnimatedSnackBarType.info);
    }
  }

  String formatWord(List<TextBoxModel> wordlist) {
    String word = '';
    for (var element in wordlist) {
      word = word + element.value;
    }
    return word;
  }

  Color validateLetter(int index) {
    String word = removeAccentuation(secretWord).toUpperCase();
    String letter = word[index];
    String currentLetter = textBoxList[activeRow][index].value;
    if (letter == currentLetter) {
      return const Color(0xFF85DF7D);
    } else if (word.contains(currentLetter)) {
      return const Color(0xFFFFECA9);
    } else {
      return const Color(0xFFBEBEBE);
    }
  }

  String removeAccentuation(String text) {
    return text
        .replaceAll(RegExp(r'[áàãâä]'), 'a')
        .replaceAll(RegExp(r'[éèêë]'), 'e')
        .replaceAll(RegExp(r'[íìîï]'), 'i')
        .replaceAll(RegExp(r'[óòõôö]'), 'o')
        .replaceAll(RegExp(r'[úùûü]'), 'u')
        .replaceAll(RegExp(r'[ç]'), 'c')
        .replaceAll(RegExp(r'[ñ]'), 'n');
  }

  @action
  void setBoxColors() {
    textBoxList[activeRow][0].setColor(validateLetter(0));
    activeBox = 0;
    Timer(const Duration(milliseconds: 400), () {
      textBoxList[activeRow][1].setColor(validateLetter(1));
      activeBox = 1;
      Timer(const Duration(milliseconds: 400), () {
        textBoxList[activeRow][2].setColor(validateLetter(2));
        activeBox = 2;
        Timer(const Duration(milliseconds: 400), () {
          textBoxList[activeRow][3].setColor(validateLetter(3));
          activeBox = 3;
          Timer(const Duration(milliseconds: 400), () {
            textBoxList[activeRow][4].setColor(validateLetter(4));
            activeBox = 4;
            Timer(const Duration(milliseconds: 150), () {
              activeRow += 1;
              activeBox = 0;
            });
          });
        });
      });
    });
  }

  @action
  void startErrorAnimation() {
    errorAnimate = !errorAnimate;
  }

  bool hasInTheList(String value) {
    List<String> filter = wordlist
        .where((element) =>
            removeAccentuation(value).toUpperCase() ==
            removeAccentuation(element).toUpperCase())
        .toList();
    return filter.isNotEmpty;
  }
}
