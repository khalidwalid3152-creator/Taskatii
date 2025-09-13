import 'package:hive/hive.dart';
 part 'model_task.g.dart';

@HiveType(typeId: 0)
class ModelTask {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? startTime;
  @HiveField(5)
  String? endTime;
  @HiveField(6)
  int? color;
  @HiveField(7)
  bool? iscompleted;

  ModelTask({
    this.id,
    this.title,
    this.description,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.iscompleted,
  });
}
