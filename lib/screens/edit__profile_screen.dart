import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/widgets/app_button.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String image;
  const EditProfileScreen({super.key, required this.name, required this.image});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Color(0xff4e5ae8), size: 30),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: Image.file(File(widget.image ?? "")).image,
                  ),
                  Positioned(
                    bottom: -5,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppButton(
                                  title: "Upload From Camera",
                                  onPressed: () {
                                    pickImageFromCamera();
                                  },
                                ),
                                SizedBox(height: 20),
                                AppButton(
                                  title: "Upload From Gallery",
                                  onPressed: () {
                                    pickImageFromGallery();
                                  },
                                ),
                                Row(),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: Color(0xff4e5ae8),
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(thickness: 4, color: Color(0xff4e5ae8)),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Color(0xff4e5ae8),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: Color(0xff4e5ae8), size: 30),
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
