import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:whatsappclone/feature/home/data/repos/chat/chat_repo.dart';

part 'chat_room_state.dart';

class ChatRoomCubit extends Cubit<ChatRoomState> {
  ChatRepo chatRepo;
  ChatRoomCubit(this.chatRepo) : super(ChatRoomInitial());

  Future<String?> getchatRoom(String receiverId) async {
    return await chatRepo.getchatRoom(receiverId);
  }

  Future<String?> createChatRoom(String receiverId) async {
    return await chatRepo.createChatRoom(receiverId);
  }

  Future<void> FetchReviverData(String receiverId) async {
    try {
      emit(ChatRoomLoading());
      var result = await FirebaseFirestore.instance
          .collection('users')
          .doc(receiverId)
          .get();
      final receverData = result.data() as Map<String, dynamic>;
      emit(ChatRoomSuccess(receverData));
    } catch (e) {
      emit(ChatRoomFailure(e.toString()));
    }
  }

  Future<void> sendMessage(
      String chatId, String message, String receiverId) async {
    await chatRepo.sendMessage(chatId, message, receiverId);
  }
}
