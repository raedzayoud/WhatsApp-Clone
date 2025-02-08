import 'package:flutter/material.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: LoginBody()
    ));
  }
}
