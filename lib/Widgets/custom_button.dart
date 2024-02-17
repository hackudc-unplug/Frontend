import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final Function() onTap;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,

  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {widget.onTap();},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            color:Colors.white24,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.buttonText),
        ),

      ),
    );
  }
}
