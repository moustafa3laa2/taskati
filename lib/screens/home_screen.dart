import 'package:flutter/material.dart';
import 'package:taskati/screens/add_task_screen.dart';
import 'package:taskati/widgets/add_task_button.dart';
import 'package:taskati/widgets/custom_app_bar.dart';
import 'package:taskati/widgets/day_container.dart';
import 'package:taskati/widgets/task_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  AddTaskButton(),
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
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return TaskContainer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

