import 'package:flutter/material.dart';
import 'package:whatsappclone/constant.dart';

class CustomPasswordForget extends StatelessWidget {
  const CustomPasswordForget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Password",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        const Text(
          "Forgot Password?",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: KPrimayColor),
        ),
      ],
    );
  }
}
