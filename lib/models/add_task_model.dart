import 'package:hive/hive.dart';

part 'add_task_model.g.dart';

@HiveType(typeId: 1)
class AddTaskModel extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String startTime;
  @HiveField(2)
  final String endTime;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String date;
  @HiveField(5)
  final String status;
  @HiveField(6)
  int color;

  AddTaskModel({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.date,
    required this.color,
    required this.status,
  });
}
