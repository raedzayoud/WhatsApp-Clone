
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappclone/feature/home/presentation/manager/chat_room_cubit/chat_room_cubit.dart';

class CustomSendMessage extends StatelessWidget {
  final TextEditingController controller;
  final String receiverId;
  String chatId;
  CustomSendMessage(
      {super.key,
      required this.chatId,
      required this.controller,
      required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Enter Your Message....",
                    border: InputBorder.none),
              ),
            ),
            IconButton(
                onPressed: () async {
                  if (controller.text.isNotEmpty) {
                    if (chatId == null || chatId!.isEmpty) {
                      chatId = (await BlocProvider.of<ChatRoomCubit>(context)
                          .createChatRoom(receiverId!))!;
                    }
                    if (chatId != null) {
                      BlocProvider.of<ChatRoomCubit>(context)
                          .sendMessage(chatId, controller.text, receiverId!);
                    }
                  }
                },
                icon: Icon(
                  Icons.send,
                  color: Colors.blue,
                ))
          ],
        ),
      ),
    );
  }
}
