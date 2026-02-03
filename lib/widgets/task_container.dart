import 'package:flutter/material.dart';
import 'package:taskati/models/add_task_model.dart';

class TaskContainer extends StatelessWidget {
  final AddTaskModel task;
  final void Function(DismissDirection)? onDismissed;
  const TaskContainer({super.key, required this.task, this.onDismissed, });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      secondaryBackground: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green,
        ),
        child: Icon(Icons.done_outline_sharp, color: Colors.white,size: 28,),
      ),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
        ),
        child: Icon(Icons.delete, color: Colors.white,size: 28,),
      ),
      onDismissed: onDismissed,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(task.color),
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
      ),
    );
  }
}
