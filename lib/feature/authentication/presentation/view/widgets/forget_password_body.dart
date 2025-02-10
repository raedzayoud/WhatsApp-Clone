import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/core/utlis/router.dart';
import 'package:whatsappclone/core/widget/custom_error.dart';
import 'package:whatsappclone/core/widget/custom_loading.dart';
import 'package:whatsappclone/feature/authentication/presentation/manager/authentication/authentication_cubit.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/content_body_forget_password.dart';

class forgerpasswordBody extends StatelessWidget {
  const forgerpasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String? errorMessage;
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationFailure) {
          errorMessage = state.errorMessage;
        } else if (state is AuthenticationSuccess) {
          errorMessage = null;
          Get.offAllNamed(AppRouter.login);
          Get.defaultDialog(
            title: "Success",
            middleText: "Email has been sent to your email",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "OK",
          );
        }
      },
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return CustomLoading();
        }
        return Column(
          children: [
            if (errorMessage != null) CustomError(errorMessage: errorMessage!),
            Expanded(
                child: content_body_forget_password(
                    formKey: _formKey, email: email)),
          ],
        );
      },
    );
  }
}
