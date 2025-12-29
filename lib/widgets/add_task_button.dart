import 'package:flutter/material.dart';
import '../screens/add_task_screen.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTaskScreen(),),);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff4e5ae8),
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.add, color: Colors.white),
              Text(
                " Add Task",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
