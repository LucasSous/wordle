import 'dart:async';
import 'dart:math';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:wordle/app/modules/home/models/text_box_model.dart';
import 'package:wordle/app/shared/constants/hive_constants.dart';
import 'package:wordle/app/shared/enums/status_enum.dart';
import 'package:wordle/app/shared/interfaces/hive_interface.dart';
import 'package:wordle/app/shared/models/game_data_model.dart';
import 'package:wordle/app/shared/models/statistics_model.dart';
import 'package:wordle/app/shared/models/text_box_hive_model.dart';
import 'package:wordle/app/shared/utils/dialog.dart';
import 'package:wordle/app/shared/utils/snackbar.dart';
import 'package:wordle/app/shared/wordlist/wordlist.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase() {
    _init();
  }

  final IHive<GameDataModel> _gameData = Modular.get();
  final IHive<StatisticsModel> _statistics = Modular.get();

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
  bool finalized = false;

  @observable
  bool hasVictory = false;

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
  Future<void> _init() async {
    Random random = Random();
    int randomIndex = random.nextInt(wordlist.length);
    var gameData = await _gameData.get(kGameDataKey);
    if (gameData != null) {
      secretWord = gameData.secretWord;
      textBoxList = _hiveObjectModelForMobx(gameData.words);
      activeRow = gameData.activeRow;
      finalized = gameData.finalized;
      hasVictory = gameData.hasVictory;
      correctLetters = _convertToObservableList(gameData.correctLetters);
      incorrectLetters = _convertToObservableList(gameData.incorrectLetters);
      nearbyLetters = _convertToObservableList(gameData.nearbyLetters);
    } else {
      secretWord = wordlist[randomIndex];
    }
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
    if (listOfEmpties.isNotEmpty) {
      if (activeBox < 4) {
        activeBox += 1;
      } else {
        activeBox = listOfEmpties[0];
      }
    }
    digitAnimate = false;
  }

  @action
  void clickDeleteKey() {
    if (textBoxList[activeRow][activeBox].value.isEmpty) {
      activeBox = activeBox != 0 ? activeBox - 1 : activeBox;
    }
    textBoxList[activeRow][activeBox].setValue('');
  }

  bool hasInTheList(String value) {
    List<String> filter =
        wordlist.where((element) => value == element).toList();
    return filter.isNotEmpty;
  }

  @action
  Future<void> checkWord(BuildContext context) async {
    if (hasInTheList(formatWord(textBoxList[activeRow]))) {
      await _setBoxColors();
      Timer(const Duration(milliseconds: 150), () async {
        if (formatWord(textBoxList[activeRow]) == secretWord) {
          openDialog(
            context: context,
            title: 'Parabéns!',
            message: 'A palavara era ',
            buttonName: 'PRÓXIMO',
            secretWord: secretWord,
            clickButton: () async {
              await nextGame();
              Modular.to.pop();
            },
          );
          finalized = true;
          hasVictory = true;
        } else {
          if (activeRow == 5) {
            openDialog(
              context: context,
              title: 'Poxa 😞',
              message: 'A palavara era ',
              buttonName: 'PRÓXIMO',
              secretWord: secretWord,
              secretWordColor: Colors.red.shade400,
              clickButton: () async {
                await nextGame();
                Modular.to.pop();
              },
            );
            finalized = true;
            hasVictory = false;
          } else {
            activeRow += 1;
            activeBox = 0;
          }
        }
        await _updateGameData();
      });
    } else {
      _startErrorAnimation();
      snackbar(
          context: context,
          message: 'Ops, esta ai não contem na lista de palavras.',
          type: AnimatedSnackBarType.info);
    }
  }

  @action
  Future<void> _setBoxColors() async {
    List<Status> status = _returnStatus();
    for (var i = 0; i < textBoxList[activeRow].length; i++) {
      await Future.delayed(Duration(milliseconds: i > 0 ? 400 : 0));
      textBoxList[activeRow][i].setStatus(status[i]);
      activeBox = i;
    }
  }

  String formatWord(List<TextBoxModel> wordlist) {
    String word = '';
    for (var element in wordlist) {
      word = word + element.value;
    }
    return word;
  }

  Map<String, int> _countLetters(String text) {
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
  List<Status> _returnStatus() {
    List<Status> status = [];
    Map<String, int> secretLetterCount = _countLetters(secretWord);

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

  @action
  void _startErrorAnimation() {
    errorAnimate = true;
    Timer(const Duration(milliseconds: 300), () {
      errorAnimate = false;
    });
  }

  @action
  void _resetAll() {
    textBoxList = ObservableList<ObservableList<TextBoxModel>>.of(List.generate(
        6,
        (index) => ObservableList<TextBoxModel>.of(
            List.generate(5, (index) => TextBoxModel()))));
    activeBox = 0;
    activeRow = 0;
    secretWord = '';
    finalized = false;
    correctLetters = ObservableList.of([]);
    nearbyLetters = ObservableList.of([]);
    incorrectLetters = ObservableList.of([]);
  }

  @action
  Future<void> nextGame() async {
    finalized = false;
    await _updateStatistics(hasVictory);
    await _gameData.put(kGameDataKey, null);
    _resetAll();
    _init();
  }

  Future<void> _updateGameData() async {
    await _gameData.put(
      kGameDataKey,
      GameDataModel(
        words: _mobxModelForHiveObject(textBoxList),
        secretWord: secretWord,
        activeRow: activeRow,
        finalized: finalized,
        hasVictory: hasVictory,
        correctLetters: correctLetters,
        incorrectLetters: incorrectLetters,
        nearbyLetters: nearbyLetters,
      ),
    );
  }

  List<List<TextBoxHiveModel>> _mobxModelForHiveObject(
      ObservableList<ObservableList<TextBoxModel>> words) {
    List<List<TextBoxHiveModel>> list = [];
    for (var i = 0; i < 6; i++) {
      list.add([]);
      for (var element in words[i]) {
        list[i].add(
            TextBoxHiveModel(value: element.value, status: element.status));
      }
    }
    return list;
  }

  ObservableList<ObservableList<TextBoxModel>> _hiveObjectModelForMobx(
      List<List<TextBoxHiveModel>> words) {
    ObservableList<ObservableList<TextBoxModel>> list =
        ObservableList<ObservableList<TextBoxModel>>.of([]);
    for (var i = 0; i < 6; i++) {
      list.add(ObservableList<TextBoxModel>.of([]));
      for (var element in words[i]) {
        list[i].add(TextBoxModel(value: element.value, status: element.status));
      }
    }
    return list;
  }

  ObservableList<String> _convertToObservableList(List<String> observableList) {
    ObservableList<String> list = ObservableList<String>.of([]);
    for (var element in observableList) {
      list.add(element);
    }
    return list;
  }

  Future<void> _updateStatistics(bool hasVictory) async {
    var statistics = await _statistics.get(kStatisticsKey);
    await _statistics.put(
        kStatisticsKey, _returnStatisticsModel(statistics, hasVictory));
  }

  StatisticsModel _returnStatisticsModel(
      StatisticsModel? statistics, bool hasVictory) {
    if (statistics != null) {
      return StatisticsModel(
        numberOfMatches: statistics.numberOfMatches + 1,
        numberOfWins: _newNumberOfWins(statistics.numberOfWins, hasVictory),
        longestSequence: _newLongestSequence(statistics.longestSequence,
            _newCurrentSequence(statistics.currentSequence, hasVictory)),
        currentSequence:
            _newCurrentSequence(statistics.currentSequence, hasVictory),
        attempts: _newAttempts(statistics.attempts, hasVictory),
      );
    } else {
      return StatisticsModel(
        numberOfMatches: 1,
        numberOfWins: _newNumberOfWins(0, hasVictory),
        longestSequence:
            _newLongestSequence(0, _newCurrentSequence(0, hasVictory)),
        currentSequence: _newCurrentSequence(0, hasVictory),
        attempts:
            _newAttempts({1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0}, hasVictory),
      );
    }
  }

  int _newNumberOfWins(int currentValue, bool hasVictory) {
    return hasVictory ? currentValue + 1 : currentValue;
  }

  int _newLongestSequence(int currentValue, int currentSequence) {
    return currentSequence > currentValue ? currentSequence : currentValue;
  }

  int _newCurrentSequence(int currentValue, bool hasVictory) {
    return hasVictory ? currentValue + 1 : 0;
  }

  Map<int, int> _newAttempts(Map<int, int> currentValue, bool hasVictory) {
    if (hasVictory) {
      currentValue[activeRow + 1] = currentValue[activeRow + 1]! + 1;
      return currentValue;
    } else {
      return currentValue;
    }
  }
}
