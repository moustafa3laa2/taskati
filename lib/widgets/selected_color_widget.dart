import 'package:flutter/material.dart';

class SelectedColorWidget extends StatefulWidget {
  final bool isActive;
  const SelectedColorWidget({super.key, this.isActive = false});

  @override
  State<SelectedColorWidget> createState() => _SelectedColorWidgetState();
}

class _SelectedColorWidgetState extends State<SelectedColorWidget> {
  List<Color> colors = [
    Colors.blueAccent,
    Colors.deepOrangeAccent,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: List.generate(3, (index) {
        return CircleAvatar(
          backgroundColor: colors[index],
          child: widget.isActive
              ? Icon(Icons.check, color: Colors.white)
              : null,
        );
      }),
    );
  }
}
