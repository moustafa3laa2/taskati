import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  const AppTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff4e5ae8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff4e5ae8)),
        ),
        labelText: label,
      ),
    );
  }
}
