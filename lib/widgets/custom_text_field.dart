import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.suffixIcon,
    this.maxLines = 1,
    this.readOnly = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: readOnly,
          validator: (value) {
            if (value == null || value == '') {
              return "this field is required";
            } else {
              return null;
            }
          },
          maxLines: maxLines,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,

            border: OutlineInputBorder(),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xff4e5ae8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xff4e5ae8)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
