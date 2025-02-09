import 'package:flutter/material.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/register_body.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: registerBody()
    ));
  }
}

