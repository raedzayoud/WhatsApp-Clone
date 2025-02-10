import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/constant.dart';
import 'package:whatsappclone/core/utlis/router.dart';

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
        InkWell(
          onTap: () {
            Get.toNamed(AppRouter.forgerpassword);
          },
          child: const Text(
            "Forgot Password?",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: KPrimayColor),
          ),
        ),
      ],
    );
  }
}
