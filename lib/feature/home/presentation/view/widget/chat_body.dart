import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappclone/core/widget/custom_error.dart';
import 'package:whatsappclone/core/widget/custom_loading.dart';
import 'package:whatsappclone/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/chat_title.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: BlocProvider.of<HomeCubit>(context)
          .getChats(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoading();
        } else if (snapshot.hasError) {
          return CustomError(errorMessage: snapshot.error.toString());
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No chats available',style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),));
        } else {
          final chats = snapshot.data!.docs;
          return FutureBuilder(
              future: Future.wait(chats.map((chatdoc) =>
                  BlocProvider.of<HomeCubit>(context)
                      .fetchChatData(chatdoc.id))),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CustomLoading();
                }
                final chatDataList =
                    snapshot.data as List<Map<String, dynamic>>;
                return ListView.builder(
                    itemCount: chatDataList.length,
                    itemBuilder: (context, index) {
                      final chatData = chatDataList[index];
                      return chatTitle(
                        chatId: chatData['chatId'],
                        lastMessage: chatData['lastMessage'],
                        receiverData: chatData['timsstamp'],
                        timestamp: chatData['userData'],
                      );
                    });
              });
        }
      },
    );
  }
}
