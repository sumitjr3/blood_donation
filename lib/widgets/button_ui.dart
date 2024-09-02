import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final Color textColor;
  final Color backgroungColor;
  final Color borderColor;
  final String text;
  final double height;
  final double width;
  const MyButton(
      {super.key,
      required this.onTap,
      required this.textColor,
      required this.backgroungColor,
      required this.borderColor,
      required this.text,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
            color: backgroungColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor, width: 0.5)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
