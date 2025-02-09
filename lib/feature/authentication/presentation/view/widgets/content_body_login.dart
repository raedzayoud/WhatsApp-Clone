import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappclone/feature/authentication/presentation/manager/authentication/authentication_cubit.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_button.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_image.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_password_forget.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_text_field.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_title.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/signup.dart';

import 'package:whatsappclone/core/utlis/function/validator.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
class content_body_login extends StatelessWidget {
  const content_body_login({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.email,
    required this.password,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header
              const CustomTitle(
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
              const SizedBox(height: 10),
              CustomTextField(
                validator: (val) {
                  return validateEmail(val);
                },
                controller: email,
                hintText: "Enter your email",
                suffixIcon: Icon(Icons.email),
              ),
              const SizedBox(height: 20),
              CustomPasswordForget(),
              const SizedBox(height: 10),
              CustomTextField(
                validator: (val) {
                  return validatePassword(val);
                },
                controller: password,
                hintText: "Enter your password",
                suffixIcon: Icon(Icons.lock),
              ),
              const SizedBox(height: 30),
              // Nav
              CustomButton(
                text: "Login",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<AuthenticationCubit>(context)
                        .login(email.text, password.text);
                  }
                },
              ),
              CustomButton(
                text: "Continue with Google",
                onPressed: () {
                  BlocProvider.of<AuthenticationCubit>(context)
                      .signInWithGoogle();
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Signup(),
            ],
          ),
        ),
      ),
    );
  }
}
