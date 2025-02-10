import 'package:flutter/material.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(child: forgerpasswordBody(),),
    );
  }
}