import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappclone/core/widget/custom_error.dart';
import 'package:whatsappclone/core/widget/custom_loading.dart';
import 'package:whatsappclone/feature/home/presentation/manager/chat_room_cubit/chat_room_cubit.dart';

class ChatScreenView extends StatefulWidget {
  final String? chatId;
  final String? recevierId;
  const ChatScreenView(
      {super.key, required this.chatId, required this.recevierId});

  @override
  State<ChatScreenView> createState() => _ChatScreenViewState();
}

class _ChatScreenViewState extends State<ChatScreenView> {
  late String chatId;
  @override
  void initState() {
    chatId = widget.chatId!;
    BlocProvider.of<ChatRoomCubit>(context)
        .FetchReviverData(widget.recevierId!);
    super.initState();
  }

  // 1- convert to bloc
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<ChatRoomCubit, ChatRoomState>(builder: (context, state) {
        if (state is ChatRoomSuccess) {
          return SafeArea(
            child: Column(
              children: [
                Text("name : ${state.receiverData['fullName']}"),
              ],
            ),
          );
        } else if (state is ChatRoomLoading) {
          return CustomLoading();
        } else if (state is ChatRoomFailure) {
          return CustomError(
              errorMessage: "There is a problem , Please try again");
        } else {
          return Center(
            child: Text("No Data Availbale"),
          );
        }
      }),
    );
  }
}
