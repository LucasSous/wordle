import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'text_box_model.g.dart';

class TextBoxModel = TextBoxModelBase with _$TextBoxModel;

abstract class TextBoxModelBase with Store {
  TextBoxModelBase({this.value = '', this.color = Colors.white});

  @observable
  String value;

  @observable
  Color color;
}
