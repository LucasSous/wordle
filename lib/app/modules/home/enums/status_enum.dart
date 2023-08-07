import 'package:hive/hive.dart';

part 'status_enum.g.dart';

@HiveType(typeId: 2)
enum Status {
  @HiveField(0)
  correct,
  @HiveField(1)
  incorrect,
  @HiveField(2)
  near,
  @HiveField(3)
  standard,
}
