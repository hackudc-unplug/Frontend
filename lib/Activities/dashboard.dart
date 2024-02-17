import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/Widgets/custom_button.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomButton(buttonText: "Exit", onTap: onTap),
              CustomButton(buttonText: "Picture", onTap: onTap),
              CustomButton(buttonText: "Profile", onTap: onTap),
              CustomButton(buttonText: "Grpahs", onTap: onTap),
            ],
          )
        ),
    );
  }
}
