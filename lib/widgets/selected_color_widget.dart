import 'package:flutter/material.dart';

class SelectedColorWidget extends StatefulWidget {

  const SelectedColorWidget({
    super.key,
  });

  @override
  State<SelectedColorWidget> createState() => _SelectedColorWidgetState();
}

class _SelectedColorWidgetState extends State<SelectedColorWidget> {
  List<Color> colors =[Colors.blueAccent,Colors.deepOrangeAccent,Colors.redAccent];
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: List.generate(3, (index) {
        return CircleAvatar(backgroundColor: colors[index],);
      }),
    );
  }
}
