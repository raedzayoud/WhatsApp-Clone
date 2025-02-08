
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/core/utlis/router.dart';

class Signup extends StatelessWidget {
  const Signup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {
        Get.toNamed(AppRouter.register);
      },
      child: Text(
        "Don't have an account? Sign up",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ));
  }
}
