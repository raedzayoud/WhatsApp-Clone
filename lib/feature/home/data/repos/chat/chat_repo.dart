abstract class ChatRepo {
  Future<String?> getchatRoom(String receiverId);
  Future<String> createChatRoom(String receiverId);
  Future<void> sendMessage(String chatId, String message, String receiverId);
}
