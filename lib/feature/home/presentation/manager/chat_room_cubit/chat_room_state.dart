part of 'chat_room_cubit.dart';

@immutable
sealed class ChatRoomState {}

final class ChatRoomInitial extends ChatRoomState {}
final class ChatRoomSuccess extends ChatRoomState {}
