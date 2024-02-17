import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_demo/Activities/picture_screen.dart';
import 'package:project_demo/Utils/navigate.dart';
import 'package:project_demo/Widgets/custom_button.dart';
import 'package:project_demo/Widgets/custom_input.dart';

class LoginPageActivity extends StatefulWidget { //
  const LoginPageActivity({super.key});

  @override
  State<LoginPageActivity> createState() => _LoginPageActivityState();
}


class _LoginPageActivityState extends State<LoginPageActivity> {

  TextEditingController tcUser = TextEditingController(); //Amb aixo es recollira el text , es guardara aqui com a tc.text
  TextEditingController tcPass = TextEditingController();

  @override
  void initState() { //Tenir dades per despres mostrarles, abans de que es mostri cap widget
    //Fer totes les peticions a la api
    // TODO: implement initState
    super.initState();
  }
  goToNextPage(){
    AccessNavigator.accessTo(this.context,PickImage());
  }
  @override
  Widget build(BuildContext context) {//genera la pagina (pantalla)

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column( //amb majuscula pq clase
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [// dintre del children un array de widgtet , 1 children i dintre children array de coses
          //Image.asset('assets/images/icon.pn'),
          Icon(
            Icons.electric_bolt,
            size: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                child: InputCustom(placeholder: "Username", tc: tcUser, isPassword: false,)
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: InputCustom(placeholder: "Password", tc: tcPass, isPassword: true,)
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: CustomButton(buttonText: 'Submit', onTap: () { goToNextPage(); },)
          )
        ],
      ),
    );
  }
}
