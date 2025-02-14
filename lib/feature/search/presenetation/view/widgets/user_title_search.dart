import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
import 'package:whatsappclone/core/utlis/router.dart';
import 'package:whatsappclone/feature/home/presentation/manager/chat_room_cubit/chat_room_cubit.dart';
import 'package:whatsappclone/feature/home/presentation/view/chat_screen_view.dart';

class UserTitleSearch extends StatelessWidget {
  final String name;
  final String email;
  final String userId;

  const UserTitleSearch({
    super.key,
    required this.name,
    required this.email,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(AssetsImage.man),
          ),
          Expanded(
            child: ListTile(
              title: Text(name),
              subtitle: Text(email),
              onTap: () async {
                String? chatId = await BlocProvider.of<ChatRoomCubit>(context)
                        .getchatRoom(userId) ??
                    await BlocProvider.of<ChatRoomCubit>(context)
                        .createChatRoom(userId);
                Get.to(
                    () => ChatScreenView(chatId: chatId, recevierId: userId));
              },
            ),
          ),
        ],
      ),
    );
  }
}
