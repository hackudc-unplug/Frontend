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
  List<Uint8List> images = []; // List to store selected images
  List<File> selectedImages = []; // List to store selected image files
  int maxImages = 3; // Maximum number of images allowed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(maxImages, (index) {
                if (index < images.length) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.memory(images[index]),
                  );
                } else {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.add),
                  );
                }
              }),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {
                    if (images.length < maxImages) {
                      pickImage(ImageSource.gallery);
                    }
                  },
                  buttonText: 'Gallery',
                ),
                SizedBox(width: 10),
                CustomButton(
                  onTap: () {
                    if (images.length < maxImages) {
                      pickImage(ImageSource.camera);
                    }
                  },
                  buttonText: 'Camera',
                ),
              ],
            ),
            if (images.length == maxImages) // Conditionally show the "Next" button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  onTap: () {
                    AccessNavigator.accessTo(this.context, Dashboard());
                  },
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
      selectedImages.add(File(returnImage.path));
      images.add(File(returnImage.path).readAsBytesSync());
    });

    // Check if the maximum number of images is reached and show the "Next" button
    if (images.length == maxImages) {
      setState(() {});
    }
  }
}
