import 'package:flutter/material.dart';

class InputCustom extends StatefulWidget {
  final String placeholder;
  final TextEditingController tc;
  final bool isPassword;

  const InputCustom(
      {super.key,
      required this.placeholder,
      required this.tc,
      required this.isPassword});

  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword == true ? true : false,
      obscuringCharacter: "·",
      decoration: InputDecoration(
        hintText: widget.placeholder,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
      ),
      controller: widget.tc,
    );
  }
}
