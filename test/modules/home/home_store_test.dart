import 'package:flutter_test/flutter_test.dart';
import 'package:wordle/app/modules/home/home_store.dart';
import 'package:wordle/app/modules/home/models/text_box_model.dart';

void main() {
  final homeStore = HomeStore();

  test('Deve tranformar a lista em uma palavra de 5 dígitos', () {
    List<TextBoxModel> list = [
      TextBoxModel(value: 'T'),
      TextBoxModel(value: 'E'),
      TextBoxModel(value: 'S'),
      TextBoxModel(value: 'T'),
      TextBoxModel(value: 'E')
    ];
    String word = homeStore.formatWord(list);
    expect(word, equals('TESTE'));
  });

  test('Deve verificar se a palavra existe na lista de palavras', () {
    bool check = homeStore.hasInTheList('POREM');
    expect(check, true);
  });
}
