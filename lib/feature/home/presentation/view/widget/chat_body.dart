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
          return const Center(
            child: Text(
              'No chats available',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          );
        } else {
          final chats = snapshot.data!.docs;

          return Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: Future.wait(
                chats.map(
                  (chatDoc) => BlocProvider.of<HomeCubit>(context)
                      .fetchChatData(chatDoc.id),
                ).toList(),
              ),
              builder: (context, futureSnapshot) {
                if (futureSnapshot.connectionState == ConnectionState.waiting) {
                  return CustomLoading();
                } else if (futureSnapshot.hasError) {
                  return CustomError(
                      errorMessage: futureSnapshot.error.toString());
                } else if (!futureSnapshot.hasData ||
                    futureSnapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'No chat data available',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  final chatDataList = futureSnapshot.data!;
                  return ListView.builder(
                    itemCount: chatDataList.length,
                    itemBuilder: (context, index) {
                      final chatData = chatDataList[index];
                      return chatTitle(
                        chatId: chatData['chatId'],
                        lastMessage: chatData['lastMessage'],
                        receiverData: chatData['userData'],
                        timestamp: chatData['timestamp'],
                      );
                    },
                  );
                }
              },
            ),
          );
        }
      },
    );
  }
}
