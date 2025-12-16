import 'package:flutter/material.dart';

class DayContainer extends StatelessWidget {
  final String month;
  final String day;
  final String dayOfWeek;
  final bool isSelected;
  const DayContainer({
    super.key,
    required this.month,
    required this.day,
    required this.dayOfWeek,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff4e5ae8) : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            spacing: 10,
            children: [
              Text(
                month,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              Text(
                day,
                style: TextStyle(
                  fontSize: 20,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              Text(
                dayOfWeek,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
