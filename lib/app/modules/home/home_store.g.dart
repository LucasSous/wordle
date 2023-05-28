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
  List<List<String>> get textBoxList {
    _$textBoxListAtom.reportRead();
    return super.textBoxList;
  }

  @override
  set textBoxList(List<List<String>> value) {
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

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void changeActiveBox(int value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeActiveBox');
    try {
      return super.changeActiveBox(value);
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
  String toString() {
    return '''
textBoxList: ${textBoxList},
activeBox: ${activeBox},
activeRow: ${activeRow}
    ''';
  }
}
