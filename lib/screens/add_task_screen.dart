import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskati/constants.dart';
import 'package:taskati/models/add_task_model.dart';
import 'package:taskati/widgets/app_button.dart';
import '../widgets/custom_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  List<Color> colors = [
    Colors.blueAccent,
    Colors.deepOrangeAccent,
    Colors.redAccent,
  ];
  int activeIndex = -1;
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TimeOfDay? startTime;
  TimeOfDay? endTime;

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
              CustomTextField(
                validator: (value) {
                  if (value == null || value == '') {
                    return "this field is required";
                  } else {
                    return null;
                  }
                },
                controller: titleController,
                title: "Title",
                hintText: "Enter Title",
              ),
              CustomTextField(
                validator: (value) {
                  if (value == null || value == '') {
                    return "this field is required";
                  } else {
                    return null;
                  }
                },
                controller: descController,
                title: "Description",
                hintText: "Enter Description",
                maxLines: 3,
              ),
              CustomTextField(
                validator: (value) {
                  if (value == null || value == '') {
                    return "this field is required";
                  } else {
                    return null;
                  }
                },
                controller: dateController,
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
                    ).then((value) {
                      dateController.text = DateFormat.yMd()
                          .format(value ?? DateTime.now())
                          .toString();
                    });
                  },
                  icon: Icon(Icons.date_range),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      validator: (value) {
                        if (value == null || value == '') {
                          return "this field is required";
                        } else {
                          return null;
                        }
                      },
                      controller: startTimeController,
                      readOnly: true,
                      title: "Start Time",
                      hintText: "09:08 PM",
                      suffixIcon: IconButton(
                        onPressed: () {
                          showTimePicker(
                            barrierDismissible: false,
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            startTime = value;
                            startTimeController.text =
                                value?.format(context) ?? "".toString();
                          });
                        },
                        icon: Icon(Icons.access_time),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(validator: (value){
                      if(startTime?.isAfter(endTime!)??false){
                        return "end time should be after start time";
                      }
                    },
                      controller: endTimeController,
                      readOnly: true,
                      title: "End Time",
                      hintText: "09:08 PM",
                      suffixIcon: IconButton(
                        onPressed: () {
                          showTimePicker(
                            barrierDismissible: false,
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            endTime = value;
                            endTimeController.text =
                                value?.format(context) ?? "".toString();
                          });
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
              Row(
                spacing: 10,
                children: List.generate(3, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: colors[index],
                      child: activeIndex == index
                          ? Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                }),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    title: "Create Task",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (activeIndex == -1) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Error!!"),
                              content: Text("Please Select Task Color ."),
                            ),
                          );
                          return;
                        }
                        Hive.box<AddTaskModel>(Constants.tasksBox).add(
                              AddTaskModel(
                                title: titleController.text,
                                startTime: startTimeController.text,
                                endTime: endTimeController.text,
                                description: descController.text,
                                date: dateController.text,
                                color: colors[activeIndex].toARGB32(),
                                status: "TODO",
                              ),
                            )
                            .then((value) {
                              Navigator.pop(context);
                            })
                            .catchError((e) {
                              print("Error $e");
                            });
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
