import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeRepo {
  Stream<QuerySnapshot> getChats(String userId);
  Future<void> signoutwithgoogle();
  Future<void> signout();
  Future<Map<String, dynamic>> fetchChatData(String chatId);
}
