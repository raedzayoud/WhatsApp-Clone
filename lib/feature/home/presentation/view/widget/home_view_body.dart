import 'package:flutter/material.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/chat_body.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/custom_appar_home.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomApparHome(),
        ChatBody(),
      ],
    );
  }
}
