import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappclone/core/widget/custom_error.dart';
import 'package:whatsappclone/core/widget/custom_loading.dart';
import 'package:whatsappclone/feature/home/presentation/manager/chat_room_cubit/chat_room_cubit.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/custom_appar_chat_screen.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/custom_send_message.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/message_stream.dart';

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
  TextEditingController _textcontroller = TextEditingController();
  @override
  void initState() {
    chatId = widget.chatId!;
    BlocProvider.of<ChatRoomCubit>(context)
        .FetchReviverData(widget.recevierId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<ChatRoomCubit, ChatRoomState>(builder: (context, state) {
        if (state is ChatRoomSuccess) {
          return SafeArea(
            child: Column(
              children: [
                CustomApparChatScreen(
                  receiverData: state.receiverData,
                ),
                Expanded(
                    child: chatId!=null && chatId.isNotEmpty
                        ? MessageStreem(
                            chatId: chatId,
                          )
                        : Center(
                            child: Text("No Message Yet"),
                          )),
                CustomSendMessage(
                  chatId: chatId,
                  controller: _textcontroller,
                  receiverId: widget.recevierId!,
                )
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
