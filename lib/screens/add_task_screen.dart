import 'package:flutter/material.dart';
import 'package:taskati/widgets/app_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/selected_color_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Task",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff4e5ae8),
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff4e5ae8), size: 28),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              CustomTextField(title: "Title", hintText: "Enter Title"),
              CustomTextField(
                title: "Description",
                hintText: "Enter Description",
                maxLines: 3,
              ),
              CustomTextField(
                readOnly: true,
                title: "Date",
                hintText: "24-12-2025",
                suffixIcon: IconButton(
                  onPressed: () {
                    showDatePicker(
                      barrierDismissible: false,
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                  },
                  icon: Icon(Icons.date_range),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      readOnly: true,
                      title: "Start Time",
                      hintText: "09:08 PM",
                      suffixIcon: IconButton(
                        onPressed: () {
                          showTimePicker(
                            barrierDismissible: false,
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                        },
                        icon: Icon(Icons.access_time),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      readOnly: true,
                      title: "End Time",
                      hintText: "09:08 PM",
                      suffixIcon: IconButton(
                        onPressed: () {
                          showTimePicker(
                            barrierDismissible: false,
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                        },
                        icon: Icon(Icons.access_time),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Color",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SelectedColorWidget(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    title: "Create Task",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        debugPrint("done");
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
