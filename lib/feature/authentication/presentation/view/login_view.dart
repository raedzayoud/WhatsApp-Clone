import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/core/utlis/function/validator.dart';
import 'package:whatsappclone/core/utlis/router.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_button.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_image.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_password_forget.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_text_field.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_title.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/signup.dart';

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
              //Header
              CustomTitle(
                title: "Login",
                subtitle: "Welcome back to the app",
              ),
              CustomImage(
                url: AssetsImage.whatsapp,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              //Body
              const Text(
                "Email Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              CustomTextField(
                validator: (val){
                  return validateEmail(val);
                },
                controller: email,
                hintText: "Enter your email",
                suffixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 20),
              CustomPasswordForget(),
              SizedBox(height: 10),
              CustomTextField(
                validator: (val){
                  return validatePassword(val);
                },
                controller: password,
                hintText: "Enter your password",
                suffixIcon: Icon(Icons.lock),
              ),
              SizedBox(height: 30),
              // Nav
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
              Signup()
            ],
          ),
        ),
      ),
    ));
  }
}
