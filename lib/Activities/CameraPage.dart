import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_demo/Activities/DashboardPage.dart';
import 'package:project_demo/Widgets/Button/CustomButton.dart';

import '../Utils/AccessNavigator.dart';
import 'InitalCameraPage.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}


class _CameraPageState extends State<CameraPage> {
  List<Uint8List> images = []; // List to store selected images
  List<File> selectedImages = []; // List to store selected image files
  int maxImages = 3; // Maximum number of images allowed
  int currentPage = 0;
  List<Widget> pages = [];

  changePage(int toPage){
    setState(() {
      currentPage = toPage;
    });
  }

  @override
  void didChangeDependencies() {
   pages = [ InitialCameraPage(changePage: (int page) { changePage(page); },),DashboardPage()];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage]
    );
  }


}
