import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/core/widget/custom_error.dart';
import 'package:whatsappclone/core/widget/custom_loading.dart';
import 'package:whatsappclone/feature/authentication/presentation/manager/authentication/authentication_cubit.dart';

import 'package:flutter/material.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/content_body_login.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String? errorMessage;

    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationFailure) {
          errorMessage = state.errorMessage;

          print("Authentication Failure: ${state.errorMessage}");
        } else if (state is AuthenticationSuccess) {
          errorMessage = null;

          Get.snackbar("Success", "Login successful");
          print("Authentication Success");
        }
      },
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return CustomLoading();
        } else {
          return Column(
            children: [
              if (errorMessage != null)
                CustomError(errorMessage: errorMessage!),
              Expanded(
                child: content_body_login(
                  formKey: _formKey,
                  email: email,
                  password: password,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
