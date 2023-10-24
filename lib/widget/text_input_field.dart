import 'package:flutter/material.dart';
import 'package:testt/constants.dart';


class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String lableText;
  final bool isObscure;
  final IconData icon;

  const TextInputField({Key? key,
    required this.controller,
    required this.lableText,
    this.isObscure=false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: lableText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:  BorderSide(
            color: borderColors,
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColors,
          ),
        ),
      ),
      obscureText: isObscure,
    );
  }
}
