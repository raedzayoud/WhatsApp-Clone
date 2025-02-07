import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/constant.dart';
import 'package:whatsappclone/core/router.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_button.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_password_forget.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_text_field.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_title.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(
                title: "Login",
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
              SizedBox(height: 10),
              CustomTextField(
                controller: email,
                hintText: "Enter your email",
                suffixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 20),
              CustomPasswordForget(),
              SizedBox(height: 10),
              CustomTextField(
                controller: password,
                hintText: "Enter your password",
                suffixIcon: Icon(Icons.lock),
              ),
              SizedBox(height: 30),
              CustomButton(
                text: "Login",
                onPressed: () {},
              ),
              CustomButton(
                text: "Continue with Google",
                onPressed: () {},
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: InkWell(
                onTap: () {
                  Get.toNamed(AppRouter.register);
                },
                child: Text(
                  "Don't have an account? Sign up",
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
