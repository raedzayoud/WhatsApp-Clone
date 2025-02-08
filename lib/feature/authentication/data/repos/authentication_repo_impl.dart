import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/feature/authentication/data/repos/authentication_repo.dart';

class AuthenticationRepoImpl implements AuthenticationRepo {
  @override
  Future<void> login(String email, String password) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signout() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signup(String email, String password, String fullName) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // create collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'uid': userCredential.user?.uid,
        'fullName': fullName,
        'email': email,
      });
      await userCredential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print('Failed to sign up: $e');
    }
  }
}
