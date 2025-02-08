import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
import 'package:whatsappclone/core/utlis/router.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_button.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_image.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: MediaQuery.of(context).size.height * .1),
          child: Column(
            children: [
              CustomImage(
                url: AssetsImage.welcome,
              ),
              Text(
                "Welcome to the whatsapp Clone ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome to Our App! 🎉\n We're glad to have you here! Enjoy a smooth and intuitive experience with all the features you need at your fingertips. Let’s get started! 🚀",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              Spacer(),
              CustomButton(
                text: "Login",
                onPressed: () {
                  Get.toNamed(AppRouter.login);
                },
              ),
              CustomButton(
                text: "Create an Account",
                onPressed: () {
                  Get.toNamed(AppRouter.register);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
