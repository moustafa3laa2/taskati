import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "Hello, Mustafa Alaa Ahmed",
        style: TextStyle(
          color: Color(0xff4e5ae8),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        "Have A Nice Day.",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing: CircleAvatar(
        radius: 50,

        child: ClipOval(
          child: Image.asset(
            height: 60,
            width: 60,
            fit: BoxFit.cover,
            "assets/images/pic.jpg",
          ),
        ),
      ),
    );
  }
}
