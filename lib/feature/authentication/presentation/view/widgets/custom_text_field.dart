
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget suffixIcon;
  const CustomTextField(
      {super.key, required this.controller, required this.hintText, required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: TextEditingController(),
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              borderSide:
                  BorderSide(color: Colors.grey), // Border color when focused
            ),
            suffixIcon: suffixIcon,
            hintText: hintText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),
      ),
    );
  }
}
