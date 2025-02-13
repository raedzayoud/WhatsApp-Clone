import 'package:flutter/material.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/chat_screen_body.dart';

class ChatScreenView extends StatelessWidget {
  const ChatScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatScreenBody(),
    );
  }
}