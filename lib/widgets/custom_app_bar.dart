import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/models/user_model.dart';
import 'package:taskati/screens/edit__profile_screen.dart';

class CustomAppBar extends StatelessWidget {
  final UserModel? user;
  const CustomAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "Hello, ${user?.name ?? ""}",
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
      trailing: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfileScreen(name: user?.name??"",image: user?.image??"",)),
          );
        },
        child: CircleAvatar(
          radius: 50,

          backgroundImage: Image.file(File(user?.image ?? "")).image,
        ),
      ),
    );
  }
}
