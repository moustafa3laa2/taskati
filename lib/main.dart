import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/constants.dart';
import 'package:taskati/models/add_task_model.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/taskati.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   Hive.registerAdapter(UserModelAdapter());
   Hive.registerAdapter(AddTaskModelAdapter());
  await Hive.openBox<UserModel>(Constants.userBox);
  await Hive.openBox<AddTaskModel>(Constants.tasksBox);
  runApp(Taskati());
}
