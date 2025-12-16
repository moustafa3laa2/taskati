import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xff4e5ae8),
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child: Row(
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Flutter Task - 1",
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
                    "06:19 AM - 06:40 AM",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Text(
                "i will do this task",
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
              "TODO",
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
