import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/constant.dart';
import 'package:whatsappclone/core/router.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_button.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_password_forget.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_text_field.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_title.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController fullname = TextEditingController();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(
                title: "Register",
                subtitle: "Welcome back to the app",
              ),
               SizedBox(
                  height: 140,
                  child: Center(child: Image.asset(AssetsImage.whatsapp))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              const Text(
                "Email Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: email,
                hintText: "Enter your email",
                suffixIcon: Icon(Icons.email),
              ),
              const SizedBox(height: 10),
              const Text(
                "Full Name ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: fullname,
                hintText: "Enter your full name ",
                suffixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 10),
              const Text(
                "Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: password,
                hintText: "Enter your password",
                suffixIcon: Icon(Icons.lock),
              ),
              SizedBox(height: 30),
              CustomButton(
                text: "Register",
                onPressed: () {},
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "have an account?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
