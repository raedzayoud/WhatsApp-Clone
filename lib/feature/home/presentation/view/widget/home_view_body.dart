import 'package:flutter/material.dart';
import 'package:whatsappclone/constant.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/custom_appar_home.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/custom_icon_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomApparHome()
      ],
    );
  }
}
