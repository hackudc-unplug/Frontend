import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_demo/Activities/dashboard.dart';
import 'package:project_demo/Widgets/custom_button.dart';

import '../Utils/navigate.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  Uint8List? image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 20),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () { pickImage(ImageSource.gallery);},
                  buttonText: 'Gallery',
                ),
                SizedBox(width: 10),
                CustomButton(
                  onTap: () { pickImage(ImageSource.camera);},
                  buttonText: 'Camera',
                ),
              ],
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: CustomButton(
                onTap: () {    AccessNavigator.accessTo(this.context,Dashboard());},
                buttonText: 'Next',
             ),
           )
          ],
        ),
      ),
    );
  }

  pickImage(ImageSource source) async {
    final returnImage = await ImagePicker().pickImage(source: source);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      image = File(returnImage.path).readAsBytesSync();
    });
  }
}

