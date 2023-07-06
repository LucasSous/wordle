import 'dart:async';
import 'dart:math';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:wordle/app/modules/home/enums/status_enum.dart';
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

  @observable
  ObservableList<String> correctLetters = ObservableList.of([]);

  @observable
  ObservableList<String> nearbyLetters = ObservableList.of([]);

  @observable
  ObservableList<String> incorrectLetters = ObservableList.of([]);

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
    secretWord = removeAccentuation(wordlist[randomIndex]).toUpperCase();
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

  Map<String, int> countLetters(String text) {
    Map<String, int> letterCount = {};

    for (int i = 0; i < text.length; i++) {
      String letter = text[i];
      if (letterCount.containsKey(letter)) {
        letterCount[letter] = letterCount[letter]! + 1;
      } else {
        letterCount[letter] = 1;
      }
    }

    return letterCount;
  }

  @action
  List<Status> returnStatus() {
    List<Status> status = [];
    Map<String, int> secretLetterCount = countLetters(secretWord);

    for (var i = 0; i < 5; i++) {
      String playerLetter = textBoxList[activeRow][i].value;
      if (secretWord[i] == playerLetter) {
        if (secretLetterCount[playerLetter]! > 1) {
          secretLetterCount[playerLetter] =
              secretLetterCount[playerLetter]! - 1;
        } else {
          secretLetterCount[playerLetter] = 0;
        }
      }
    }

    for (var i = 0; i < secretWord.length; i++) {
      String playerLetter = textBoxList[activeRow][i].value;
      if (secretWord[i] == playerLetter) {
        status.add(Status.correct);
        correctLetters.add(playerLetter);
      } else if (secretWord.contains(playerLetter)) {
        if (secretLetterCount[playerLetter]! > 0) {
          status.add(Status.near);
          secretLetterCount[playerLetter] =
              secretLetterCount[playerLetter]! - 1;
          nearbyLetters.add(playerLetter);
        } else {
          status.add(Status.incorrect);
          incorrectLetters.add(playerLetter);
        }
      } else {
        status.add(Status.incorrect);
        incorrectLetters.add(playerLetter);
      }
    }

    return status;
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
    List<Status> status = returnStatus();
    textBoxList[activeRow][0].setStatus(status[0]);
    activeBox = 0;
    Timer(const Duration(milliseconds: 400), () {
      textBoxList[activeRow][1].setStatus(status[1]);
      activeBox = 1;
      Timer(const Duration(milliseconds: 400), () {
        textBoxList[activeRow][2].setStatus(status[2]);
        activeBox = 2;
        Timer(const Duration(milliseconds: 400), () {
          textBoxList[activeRow][3].setStatus(status[3]);
          activeBox = 3;
          Timer(const Duration(milliseconds: 400), () {
            textBoxList[activeRow][4].setStatus(status[4]);
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
    errorAnimate = true;
    Timer(const Duration(milliseconds: 300), () {
      errorAnimate = false;
    });
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
