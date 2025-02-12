import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_room_state.dart';

class ChatRoomCubit extends Cubit<ChatRoomState> {
  ChatRoomCubit() : super(ChatRoomInitial());
}
