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
  void checkWord() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.checkWord');
    try {
      return super.checkWord();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBoxColors() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setBoxColors');
    try {
      return super.setBoxColors();
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
  String toString() {
    return '''
textBoxList: ${textBoxList},
activeBox: ${activeBox},
activeRow: ${activeRow},
errorAnimate: ${errorAnimate},
digitAnimate: ${digitAnimate}
    ''';
  }
}
