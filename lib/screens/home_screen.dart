import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/constants.dart';
import 'package:taskati/models/add_task_model.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/screens/add_task_screen.dart';
import 'package:taskati/widgets/custom_app_bar.dart';
import 'package:taskati/widgets/task_container.dart';
import '../widgets/add_task_button.dart';
import '../widgets/status_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? user = Hive.box<UserModel>(Constants.userBox).getAt(0);
  List<String> statusList = ["ALL", "TODO", "COMPLETE"];
  int currentActiveIndex = 0;
  List<AddTaskModel> tasks=[];
  @override
  Widget build(BuildContext context) {
    if(currentActiveIndex==0){
      tasks = Hive.box<AddTaskModel>(Constants.tasksBox,).values.toList();
    }else if(currentActiveIndex==1){
      tasks = Hive.box<AddTaskModel>(Constants.tasksBox,).values.toList().where((e)=>e.status.toLowerCase()=="todo").toList();
    }else{
      tasks = Hive.box<AddTaskModel>(Constants.tasksBox,).values.toList().where((e)=>e.status.toLowerCase()=="complete").toList();

    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              CustomAppBar(user: user),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "December 16/2025",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  AddTaskButton(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTaskScreen(),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: List.generate(
                  statusList.length,
                  (index) => StatusContainer(
                    isSelected: currentActiveIndex == index,
                    onTap: () {
                      setState(() {
                        currentActiveIndex = index;
                      });
                    },

                    title: statusList[index],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Visibility(
                visible: tasks.isEmpty,

                replacement: Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return TaskContainer(
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            deleteTask(index);
                          } else {
                            updateTaskStatus(index);
                          }
                        },
                        task: tasks[index],
                      );
                    },
                  ),
                ),
                child: Lottie.asset("assets/images/empty_task.json"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var myBox = Hive.box<AddTaskModel>(Constants.tasksBox);
  deleteTask(int index) {
    myBox.deleteAt(index);
    setState(() {});
  }

  updateTaskStatus(int index) {
    AddTaskModel? updateTask = myBox.getAt(index);
    updateTask?.status = "complete";
    updateTask?.save();
    setState(() {});
  }
}
