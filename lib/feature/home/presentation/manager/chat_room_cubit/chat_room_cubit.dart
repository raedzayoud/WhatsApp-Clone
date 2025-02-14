import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whatsappclone/feature/home/data/repos/chat/chat_repo.dart';

part 'chat_room_state.dart';

class ChatRoomCubit extends Cubit<ChatRoomState> {
  ChatRepo chatRepo;
  ChatRoomCubit(this.chatRepo) : super(ChatRoomInitial());

  Future<String?> getchatRoom(String receiverId) async {
    final chatRoom = await chatRepo.getchatRoom(receiverId);
    if (chatRoom != null) {
      emit(ChatRoomSuccess());
    }
    return chatRoom;
  }

  Future<String?> createChatRoom(String receiverId) async {
    final chatRoom = await chatRepo.createChatRoom(receiverId);
    emit(ChatRoomSuccess());
    return chatRoom;
  }
}
