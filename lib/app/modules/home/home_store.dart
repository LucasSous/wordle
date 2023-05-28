import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  List<List<String>> textBoxList =
      List.generate(5, (idx) => List.generate(5, (index) => ''));

  @observable
  int activeBox = 0;

  @observable
  int activeRow = 0;

  @action
  void changeActiveBox(int value) {
    activeBox = value;
  }

  @action
  void changeActiveRow(int value) {
    activeRow = value;
  }
}
