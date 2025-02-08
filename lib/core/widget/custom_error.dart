import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomError extends StatelessWidget {
  final String errorMessage;
  const CustomError({super.key, required this.errorMessage});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.defaultDialog(
        title: "Error",
        middleText: errorMessage,
        onConfirm: (){
          Get.back();
        } ,
        textConfirm: "OK",
      );
    });
    return Container();
  }
}