import 'package:flutter/material.dart';
import 'package:whatsappclone/core/utlis/router.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {

            }, icon: Icon(Icons.person)),
            label: 'Profile',
          ),
        ],
      ),
      body: HomeViewBody(),
    );
  }
}
