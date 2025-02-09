import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/constant.dart';
import 'package:whatsappclone/core/utlis/function/validator.dart';
import 'package:whatsappclone/core/utlis/router.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
import 'package:whatsappclone/core/widget/custom_error.dart';
import 'package:whatsappclone/core/widget/custom_loading.dart';
import 'package:whatsappclone/feature/authentication/presentation/manager/authentication/authentication_cubit.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/content_body_register.dart';

class registerBody extends StatefulWidget {
  const registerBody({super.key});

  @override
  State<registerBody> createState() => _registerBodyState();
}

class _registerBodyState extends State<registerBody> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        // Handle Authentication Failure
        if (state is AuthenticationFailure) {
          if (errorMessage != state.errorMessage) { // Check if the error is new
            setState(() {
              errorMessage = state.errorMessage;
            });
          }
        } else if (state is AuthenticationSuccess) {
          // On success, clear the error message
          if (errorMessage != null) {
            setState(() {
              errorMessage = null;
            });
          }
          Get.offAllNamed(AppRouter.login);
        }
      },
      builder: (context, state) {
        if (state is AuthenticationLoading) return CustomLoading();
        return Column(
          children: [
            if (errorMessage != null) CustomError(errorMessage: errorMessage!),
            Expanded(
              child: content_body_register(
                formKey: _formKey,
                email: email,
                fullname: fullname,
                password: password,
              ),
            ),
          ],
        );
      },
    );
  }
}
