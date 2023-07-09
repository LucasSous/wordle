import 'package:flutter_test/flutter_test.dart';
import 'package:wordle/app/shared/utils/string_extension.dart';

void main() {
  test('Deve remover o acento da palavra', () {
    String word = 'josé';
    expect(word.removeAccents(), equals('jose'));
  });
}
