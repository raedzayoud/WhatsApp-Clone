
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:whatsappclone/core/utlis/assets.dart';

class CustomApparChatScreen extends StatelessWidget {
  final Map<String, dynamic> receiverData;
  const CustomApparChatScreen({super.key, required this.receiverData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: 60,
      child: Row(
        children: [
          IconButton(onPressed: () {
            Get.back();
          }, icon: Icon(Icons.arrow_back)),
          SizedBox(
            width: 17,
          ),
          CircleAvatar(
              child: Image.asset(
            AssetsImage.man,
            scale: MediaQuery.of(context).size.height * .001,
          )),
          SizedBox(
            width: 5,
          ),
          Text(
            "${receiverData['fullName']}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
