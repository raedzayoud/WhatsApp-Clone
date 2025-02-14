part of 'chat_room_cubit.dart';

@immutable
sealed class ChatRoomState {}

final class ChatRoomInitial extends ChatRoomState {}

final class ChatRoomLoading extends ChatRoomState {}

final class ChatRoomFailure extends ChatRoomState {
  final String errorMessage;
  ChatRoomFailure(this.errorMessage);
}
final class ChatRoomSuccess extends ChatRoomState {
  final Map<String, dynamic> receiverData;
  ChatRoomSuccess(this.receiverData);
}
