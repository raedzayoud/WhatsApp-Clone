import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
        'lastMessage': '',
        'timestamp': FieldValue.serverTimestamp(),
      });
      return chatRoom.id;
    }

    throw Exception("User not found");
  }

  @override
  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> signoutwithgoogle() async {
    await GoogleSignIn().disconnect();
  }

  Future<Map<String, dynamic>> fetchChatData(String chatId) async {
    final chatDoc =
        await _firebaseFirestore.collection('chats').doc(chatId).get();
    final chatData = chatDoc.data();
    final users = chatData!['users'] as List<String>;
    final recevierId = users
        .firstWhere((element) => element != _firebaseAuth.currentUser!.uid);
    final userDoc =
        await _firebaseFirestore.collection('users').doc(recevierId).get();
    final userData = userDoc.data();
    return {
      'chatId': chatId,
      'lastMessage': chatData['lastMessage'] ?? '',
      'timestamp': chatData['timestamp']?.toDate() ?? DateTime.now(),
      'userData': userData
    };
  }
}
