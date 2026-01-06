import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/models/add_task_model.dart';
import 'package:taskati/screens/add_task_screen.dart';
import 'package:taskati/widgets/add_task_button.dart';
import 'package:taskati/widgets/custom_app_bar.dart';
import 'package:taskati/widgets/day_container.dart';
import 'package:taskati/widgets/task_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "December 16/2025",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
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
                spacing: 10,
                children: [
                  DayContainer(
                    month: "Dec",
                    day: "15",
                    dayOfWeek: "MON",
                    isSelected: true,
                  ),
                  DayContainer(month: "Dec", day: "16", dayOfWeek: "TUE"),
                  DayContainer(month: "Dec", day: "17", dayOfWeek: "WED"),
                  DayContainer(month: "Dec", day: "18", dayOfWeek: "THU"),
                ],
              ),
              SizedBox(height: 20),
              Visibility(
                visible: tasks.isEmpty,

                replacement: Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return TaskContainer(task: tasks[index]);
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
}
