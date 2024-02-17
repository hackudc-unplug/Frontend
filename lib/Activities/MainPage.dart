import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/Activities/CameraPage.dart';

import '../Widgets/NavBar/CustomTabBar.dart';
import 'BlankPage.dart';
import 'ChartPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = <Widget>[ChartPage(), CameraPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: CustomTabBar(
          onChange: (int index) {
            _onItemTapped(index);
          },
        ));
  }
}
