// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$textBoxListAtom =
      Atom(name: 'HomeStoreBase.textBoxList', context: context);

  @override
  ObservableList<ObservableList<TextBoxModel>> get textBoxList {
    _$textBoxListAtom.reportRead();
    return super.textBoxList;
  }

  @override
  set textBoxList(ObservableList<ObservableList<TextBoxModel>> value) {
    _$textBoxListAtom.reportWrite(value, super.textBoxList, () {
      super.textBoxList = value;
    });
  }

  late final _$activeBoxAtom =
      Atom(name: 'HomeStoreBase.activeBox', context: context);

  @override
  int get activeBox {
    _$activeBoxAtom.reportRead();
    return super.activeBox;
  }

  @override
  set activeBox(int value) {
    _$activeBoxAtom.reportWrite(value, super.activeBox, () {
      super.activeBox = value;
    });
  }

  late final _$activeRowAtom =
      Atom(name: 'HomeStoreBase.activeRow', context: context);

  @override
  int get activeRow {
    _$activeRowAtom.reportRead();
    return super.activeRow;
  }

  @override
  set activeRow(int value) {
    _$activeRowAtom.reportWrite(value, super.activeRow, () {
      super.activeRow = value;
    });
  }

  late final _$errorAnimateAtom =
      Atom(name: 'HomeStoreBase.errorAnimate', context: context);

  @override
  bool get errorAnimate {
    _$errorAnimateAtom.reportRead();
    return super.errorAnimate;
  }

  @override
  set errorAnimate(bool value) {
    _$errorAnimateAtom.reportWrite(value, super.errorAnimate, () {
      super.errorAnimate = value;
    });
  }

  late final _$digitAnimateAtom =
      Atom(name: 'HomeStoreBase.digitAnimate', context: context);

  @override
  bool get digitAnimate {
    _$digitAnimateAtom.reportRead();
    return super.digitAnimate;
  }

  @override
  set digitAnimate(bool value) {
    _$digitAnimateAtom.reportWrite(value, super.digitAnimate, () {
      super.digitAnimate = value;
    });
  }

  late final _$nextGameAnimateAtom =
      Atom(name: 'HomeStoreBase.nextGameAnimate', context: context);

  @override
  bool get nextGameAnimate {
    _$nextGameAnimateAtom.reportRead();
    return super.nextGameAnimate;
  }

  @override
  set nextGameAnimate(bool value) {
    _$nextGameAnimateAtom.reportWrite(value, super.nextGameAnimate, () {
      super.nextGameAnimate = value;
    });
  }

  late final _$secretWordAtom =
      Atom(name: 'HomeStoreBase.secretWord', context: context);

  @override
  String get secretWord {
    _$secretWordAtom.reportRead();
    return super.secretWord;
  }

  @override
  set secretWord(String value) {
    _$secretWordAtom.reportWrite(value, super.secretWord, () {
      super.secretWord = value;
    });
  }

  late final _$finalizedAtom =
      Atom(name: 'HomeStoreBase.finalized', context: context);

  @override
  bool get finalized {
    _$finalizedAtom.reportRead();
    return super.finalized;
  }

  @override
  set finalized(bool value) {
    _$finalizedAtom.reportWrite(value, super.finalized, () {
      super.finalized = value;
    });
  }

  late final _$correctLettersAtom =
      Atom(name: 'HomeStoreBase.correctLetters', context: context);

  @override
  ObservableList<String> get correctLetters {
    _$correctLettersAtom.reportRead();
    return super.correctLetters;
  }

  @override
  set correctLetters(ObservableList<String> value) {
    _$correctLettersAtom.reportWrite(value, super.correctLetters, () {
      super.correctLetters = value;
    });
  }

  late final _$nearbyLettersAtom =
      Atom(name: 'HomeStoreBase.nearbyLetters', context: context);

  @override
  ObservableList<String> get nearbyLetters {
    _$nearbyLettersAtom.reportRead();
    return super.nearbyLetters;
  }

  @override
  set nearbyLetters(ObservableList<String> value) {
    _$nearbyLettersAtom.reportWrite(value, super.nearbyLetters, () {
      super.nearbyLetters = value;
    });
  }

  late final _$incorrectLettersAtom =
      Atom(name: 'HomeStoreBase.incorrectLetters', context: context);

  @override
  ObservableList<String> get incorrectLetters {
    _$incorrectLettersAtom.reportRead();
    return super.incorrectLetters;
  }

  @override
  set incorrectLetters(ObservableList<String> value) {
    _$incorrectLettersAtom.reportWrite(value, super.incorrectLetters, () {
      super.incorrectLetters = value;
    });
  }

  late final _$checkWordAsyncAction =
      AsyncAction('HomeStoreBase.checkWord', context: context);

  @override
  Future<void> checkWord(BuildContext context) {
    return _$checkWordAsyncAction.run(() => super.checkWord(context));
  }

  late final _$setBoxColorsAsyncAction =
      AsyncAction('HomeStoreBase.setBoxColors', context: context);

  @override
  Future<void> setBoxColors() {
    return _$setBoxColorsAsyncAction.run(() => super.setBoxColors());
  }

  late final _$nextGameAsyncAction =
      AsyncAction('HomeStoreBase.nextGame', context: context);

  @override
  Future<void> nextGame() {
    return _$nextGameAsyncAction.run(() => super.nextGame());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void changeActiveBox(int value, bool isInRow) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeActiveBox');
    try {
      return super.changeActiveBox(value, isInRow);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeActiveRow(int value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeActiveRow');
    try {
      return super.changeActiveRow(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void randomWord() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.randomWord');
    try {
      return super.randomWord();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clickTheKey(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.clickTheKey');
    try {
      return super.clickTheKey(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clickDeleteKey() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.clickDeleteKey');
    try {
      return super.clickDeleteKey();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Status> returnStatus() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.returnStatus');
    try {
      return super.returnStatus();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startErrorAnimation() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.startErrorAnimation');
    try {
      return super.startErrorAnimation();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAll() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.resetAll');
    try {
      return super.resetAll();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textBoxList: ${textBoxList},
activeBox: ${activeBox},
activeRow: ${activeRow},
errorAnimate: ${errorAnimate},
digitAnimate: ${digitAnimate},
nextGameAnimate: ${nextGameAnimate},
secretWord: ${secretWord},
finalized: ${finalized},
correctLetters: ${correctLetters},
nearbyLetters: ${nearbyLetters},
incorrectLetters: ${incorrectLetters}
    ''';
  }
}
