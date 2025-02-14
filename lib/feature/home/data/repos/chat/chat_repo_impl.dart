import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsappclone/feature/home/data/repos/chat/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String?> getchatRoom(String receiverId) async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      final chatquery = await _firebaseFirestore
          .collection('users')
          .where('users', arrayContains: currentUser.uid)
          .get();
      final chats = chatquery.docs
          .where((chat) => chat['users'].contains(receiverId))
          .toList();

      if (chats.isNotEmpty) {
        return chats.first.id;
      }
      return null;
    }
  }
  @override
  Future<String> createChatRoom(String receiverId) async {
    final currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      final chatRoom = await _firebaseFirestore.collection("chats").add({
        'users': [currentUser.uid, receiverId],
        'lastMessage': '',
        'timestamp': FieldValue.serverTimestamp(),
      });
      return chatRoom.id;
    }
    throw Exception("User not found");
  }
   
  




}
