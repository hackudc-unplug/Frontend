import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/Activities/ChartPage.dart';
import 'package:project_demo/Activities/MainPage.dart';

import '../Utils/AccessNavigator.dart';
import '../Widgets/Button/CustomButton.dart';
import '../Widgets/Inputs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldCustom(placeHoleder: "Usuario", icon: Icons.person),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldCustom(
              placeHoleder: "Contraseña",
              icon: Icons.key,
              obscure: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, right: 16, left: 16),
            child: CustomButton(
                buttonText: "Submit",
                onTap: () {
                  AccessNavigator.accessTo(context, MainPage());
                }),
          )
        ],
      ),
    );
  }
}
