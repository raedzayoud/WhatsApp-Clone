import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
import 'package:whatsappclone/core/utlis/function/validator.dart';
import 'package:whatsappclone/feature/authentication/presentation/manager/authentication/authentication_cubit.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_button.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_image.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_text_field.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/custom_title.dart';

class content_body_forget_password extends StatelessWidget {
  const content_body_forget_password({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.email,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController email;

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
                title: "Forget Password",
                subtitle: "Enter your email to reset password",
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
              const SizedBox(height: 10),
              // Nav
              CustomButton(
                text: "Save",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                     BlocProvider.of<AuthenticationCubit>(context)
                        .forgetPassword(email.text);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
