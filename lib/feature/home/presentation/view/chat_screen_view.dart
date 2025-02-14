import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/core/widget/custom_loading.dart';

class ChatScreenView extends StatefulWidget {
  final String? chatId;
  final String? recevierId;
  const ChatScreenView({super.key, required this.chatId, required this.recevierId});

  @override
  State<ChatScreenView> createState() => _ChatScreenViewState();
}

class _ChatScreenViewState extends State<ChatScreenView> {
  late String chatId;
  @override
  void initState() {
    chatId = widget.chatId!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.recevierId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final receverData = snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold();
          }
          return Scaffold(
            appBar: AppBar(),
            body: CustomLoading(),
          );
        });
  }
}
