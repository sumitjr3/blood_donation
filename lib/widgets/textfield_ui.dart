import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget inputIcon;
  final String hintText;
  final bool obscure;
  final TextInputType type;
  final double height;
  final double width;

  const MyTextField({
    super.key,
    required this.controller,
    required this.inputIcon,
    required this.hintText,
    required this.obscure,
    required this.type,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      width: width,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height,
          maxHeight: height,
        ),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          keyboardType: type,
          decoration: InputDecoration(
            isCollapsed: false,
            isDense: false,
            contentPadding: EdgeInsets.all(screenHeight * 0.01),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 114, 114, 114)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffC62C2C)),
              borderRadius: BorderRadius.circular(15),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            suffixIcon: inputIcon,
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 114, 114, 114),
            ),
          ),
        ),
      ),
    );
  }
}
