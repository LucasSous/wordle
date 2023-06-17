import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<ObservableList<String>> textBoxList =
      ObservableList<ObservableList<String>>.of([
    ObservableList<String>.of(['', '', '', '', '']),
    ObservableList<String>.of(['', '', '', '', '']),
    ObservableList<String>.of(['', '', '', '', '']),
    ObservableList<String>.of(['', '', '', '', '']),
    ObservableList<String>.of(['', '', '', '', '']),
    ObservableList<String>.of(['', '', '', '', '']),
  ]);

  @observable
  int activeBox = 0;

  @observable
  int activeRow = 0;

  @observable
  bool errorAnimate = false;

  @action
  void changeActiveBox(int value, bool isInRow) {
    if (isInRow) activeBox = value;
  }

  @action
  void changeActiveRow(int value) {
    activeRow = value;
  }

  List<int> checkNotFilled(int value) {
    List<int> list = [];
    for (var i = 0; i < 5; i++) {
      if (textBoxList[value][i].isEmpty) {
        list.add(i);
      }
    }
    return list;
  }

  @action
  void clickTheKey(String value) {
    textBoxList[activeRow][activeBox] = value;
    var listOfEmpties = checkNotFilled(activeRow);
    if (listOfEmpties.isNotEmpty) {
      if (activeBox < 4) {
        activeBox += 1;
      } else {
        activeBox = listOfEmpties[0];
      }
    }
  }

  @action
  void clickDeleteKey() {
    if (textBoxList[activeRow][activeBox].isEmpty) {
      activeBox = activeBox != 0 ? activeBox - 1 : activeBox;
    }
    textBoxList[activeRow][activeBox] = '';
  }

  @action
  void checkWord() {
    var listOfEmpties = checkNotFilled(activeRow);
    startErrorAnimation();
    // if (listOfEmpties.isEmpty) {
    //   activeRow += 1;
    //   activeBox = 0;
    // }
  }

  @action
  void startErrorAnimation() {
    errorAnimate = !errorAnimate;
  }
}
