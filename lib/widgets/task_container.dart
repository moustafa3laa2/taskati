import 'package:flutter/material.dart';
import 'package:taskati/models/add_task_model.dart';

class TaskContainer extends StatelessWidget {
  final AddTaskModel task;
  const TaskContainer({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: task.color,
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child: Row(
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(Icons.alarm, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "${task.startTime} - ${task.endTime}",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Text(
                task.description,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          Spacer(),
          RotatedBox(
            quarterTurns: 2,
            child: Container(color: Colors.white, width: 1, height: 80),
          ),
          SizedBox(width: 10),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task.status,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
