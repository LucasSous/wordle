// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_box_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextBoxModel on TextBoxModelBase, Store {
  late final _$valueAtom =
      Atom(name: 'TextBoxModelBase.value', context: context);

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$colorAtom =
      Atom(name: 'TextBoxModelBase.color', context: context);

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  late final _$TextBoxModelBaseActionController =
      ActionController(name: 'TextBoxModelBase', context: context);

  @override
  void setValue(String value_) {
    final _$actionInfo = _$TextBoxModelBaseActionController.startAction(
        name: 'TextBoxModelBase.setValue');
    try {
      return super.setValue(value_);
    } finally {
      _$TextBoxModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColor(Color color_) {
    final _$actionInfo = _$TextBoxModelBaseActionController.startAction(
        name: 'TextBoxModelBase.setColor');
    try {
      return super.setColor(color_);
    } finally {
      _$TextBoxModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
color: ${color}
    ''';
  }
}
