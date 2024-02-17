import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_demo/Activities/DashboardPage.dart';
import 'package:project_demo/Utils/AccessNavigator.dart';
import 'package:project_demo/WebServices/WebServices.dart';
import 'package:project_demo/Widgets/Button/CustomButton.dart';

class InitialCameraPage extends StatefulWidget {
  final Function(int page) changePage;
  const InitialCameraPage({super.key, required this.changePage});

  @override
  State<InitialCameraPage> createState() => _InitialCameraPageState();
}

class _InitialCameraPageState extends State<InitialCameraPage> {
  String bill_id = "";
  List<String> idsRecive = [];
  bool canUpload = false;
  List<Uint8List> images = []; // List to store selected images
  List<File> selectedImages = []; // List to store selected image files
  int maxImages = 3; // Maximum number of images allowed
  @override
  Widget build(BuildContext context) {
    return Center(
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
              ElevatedButton(
                onPressed: () {
                  if (images.length < maxImages) {
                    pickImage(ImageSource.gallery);
                  }
                },
                child: Text('Gallery'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (images.length < maxImages) {
                    pickImage(ImageSource.camera);
                  }
                },
                child:Text( 'Camera'),
              ),
            ],
          ),
          if (canUpload) // Conditionally show the "Next" button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  AccessNavigator.accessTo(context, DashboardPage(bill_id: this.bill_id));
                },
                child: Text("Upload"),
              ),
            )
        ],
      ),
    );
  }
  // Modify the pickImage function to send the image to an API
  pickImage(ImageSource source) async {
    final returnImage = await ImagePicker().pickImage(source: source);
    if (returnImage == null) return;

    // Convert image to bytes
    Uint8List imageBytes = await returnImage.readAsBytes();

    // Send the image to the API
    await sendImageToApi(imageBytes);

    setState(() {
      selectedImages.add(File(returnImage.path));
      images.add(imageBytes);
    });

    // Check if the maximum number of images is reached and show the "Next" button
    if (images.length == maxImages) {
      setState(() {});
    }
  }

// Function to send image to API
  Future<void> sendImageToApi(Uint8List imageBytes) async {
    // Replace 'your_api_endpoint' with your actual API endpoint
    var url = Uri.parse('http://34.16.19.72:8000/bill/upload');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Attach the image as a file in the request
    request.files.add(http.MultipartFile.fromBytes('file', imageBytes, filename: 'image.jpg'));

    // Send the request
    var response = await request.send();

    // Check the status code of the response
    if (response.statusCode < 400) {
      // If successful, print the response
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      print("test"+jsonResponse.toString());
      idsRecive.add(jsonResponse.toString());
      if(idsRecive.length >= 3){
         bill_id = await WebService().sendIdS(idsRecive[0], idsRecive[1], idsRecive[2]);
         canUpload = true;
      }
    } else {
      // If not successful, print the error
      print('Failed to send image. Status code: ${response.statusCode}');
    }
  }

}
