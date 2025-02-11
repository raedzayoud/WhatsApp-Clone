import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsappclone/feature/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Stream<QuerySnapshot> getChats(String userId) {
    return _firebaseFirestore
        .collection('chats')
        .where('users', arrayContains: userId)
        .snapshots();
  }

  @override
  Future<void> sendMessage(
      String chatId, String message, String receiverId) async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      await _firebaseFirestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add({
        'message': message,
        'senderId': currentUser.uid,
        'receiverId': receiverId,
        'timestamp': FieldValue.serverTimestamp()
      });
      await _firebaseFirestore.collection('chats').doc(chatId).set({
        'users': [currentUser.uid, receiverId],
        'lastMessage': message,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

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

  Future<String> createChatRoom(String receiverId) async {
    final currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      final chatRoom = await _firebaseFirestore.collection("chats").add({
        'users': [currentUser.uid, receiverId],
        'lastname': '',
        'timestamp': FieldValue.serverTimestamp(),
      });
      return chatRoom.id;
    }

    throw Exception("User not found");
  }

  Stream<QuerySnapshot> searchUsers(String query) {
    return _firebaseFirestore
        .collection("users")
        .where('email', isGreaterThanOrEqualTo: query)
        .where('email',isLessThanOrEqualTo: query + '\uf8ff')
        .snapshots();
  }
}
