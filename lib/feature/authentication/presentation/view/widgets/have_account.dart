
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Have_Account extends StatelessWidget {
  const Have_Account({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {
        Get.back();
      },
      child: Text(
        "have an account?",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ));
  }
}
