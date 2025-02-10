import 'package:flutter/material.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HomeViewBody(),
    );
  }
}