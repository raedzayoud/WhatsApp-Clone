import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeRepo {
  Stream<QuerySnapshot>getChats(String userId);
  Future<void>sendMessage(String chatId,String message,String receiverId);
}