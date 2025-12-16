import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/screens/home_screen.dart';
import 'package:taskati/widgets/app_text_field.dart';

import '../widgets/app_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  void pickImageFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void pickImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: photo == null,
                replacement: CircleAvatar(
                  backgroundImage: Image.file(File(photo?.path ?? "")).image,
                  backgroundColor: Color(0xff333333),
                  radius: 80,
                ),
                child: CircleAvatar(
                  backgroundColor: Color(0xff333333),
                  radius: 80,
                  child: Icon(
                    Icons.person,
                    color: Color(0xff4e5ae8),
                    size: 100,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AppButton(
                onPressed: () {
                  pickImageFromCamera();
                },
                title: "Upload From Camera",
              ),
              SizedBox(height: 20),
              AppButton(
                onPressed: () {
                  pickImageFromGallery();
                },
                title: "Upload From Gallery",
              ),
              SizedBox(height: 20),
              Divider(thickness: 2),
              SizedBox(height: 20),
              AppTextField(label: "Enter Your Name"),
              SizedBox(height: 20),

              AppButton(title: "Submit", onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomeScreen()), (route) => false,);
              }),

            ],
          ),
        ),
      ),
    );
  }
}
