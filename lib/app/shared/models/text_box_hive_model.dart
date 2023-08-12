import 'package:hive/hive.dart';
import 'package:wordle/app/shared/enums/status_enum.dart';

part 'text_box_hive_model.g.dart';

@HiveType(typeId: 1)
class TextBoxHiveModel extends HiveObject {
  @HiveField(0)
  String value;

  @HiveField(1)
  Status status;

  TextBoxHiveModel({
    this.value = '',
    this.status = Status.standard,
  });
}
