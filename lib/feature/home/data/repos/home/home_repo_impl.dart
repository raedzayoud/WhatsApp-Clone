import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whatsappclone/feature/home/data/repos/home/home_repo.dart';

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
  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> signoutwithgoogle() async {
    try {
      await GoogleSignIn().disconnect();
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<Map<String, dynamic>> fetchChatData(String chatId) async {
    final chatDoc =
        await _firebaseFirestore.collection('chats').doc(chatId).get();
    final chatData = chatDoc.data();
    final users = chatData!['users'] as List<dynamic>;
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
