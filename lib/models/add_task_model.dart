import 'package:flutter/material.dart';

class AddTaskModel {
  final String title;
  final String startTime;
  final String endTime;
  final String description;
  final String date;
  final String status;
  Color color;

  AddTaskModel({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.date,
    required this.color,
    required this.status,
  });
}

List<AddTaskModel> tasks = [];
