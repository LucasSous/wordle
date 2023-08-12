import 'package:mobx/mobx.dart';
import 'package:wordle/app/shared/enums/status_enum.dart';
part 'text_box_model.g.dart';

class TextBoxModel = TextBoxModelBase with _$TextBoxModel;

abstract class TextBoxModelBase with Store {
  TextBoxModelBase({this.value = '', this.status = Status.standard});

  @observable
  String value;

  @observable
  Status status;

  @action
  void setValue(String value_) {
    value = value_;
  }

  @action
  void setStatus(Status value) {
    status = value;
  }
}
