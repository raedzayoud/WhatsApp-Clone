abstract class ChatRepo {
  Future<String?> getchatRoom(String receiverId);
  Future<String> createChatRoom(String receiverId);
  
}
