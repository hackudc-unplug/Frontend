import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/Activities/ChartPage.dart';

import 'package:project_demo/Activities/BlankPage.dart';

class CustomTabBar extends StatefulWidget {
  final Function(int) onChange;
  const CustomTabBar({super.key, required this.onChange});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  static const List<Widget> pages = <Widget>[ChartPage(), BlankPage()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: widget.onChange,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Chart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'a',
        ),
      ],
    );
  }
}
