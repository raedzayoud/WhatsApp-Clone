import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/feature/authentication/data/repos/authentication_repo.dart';
class AuthenticationRepoImpl implements AuthenticationRepo {
  @override
  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Wrong password provided for that user.',
        );
      } else {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Failed to login',
        );
      }
    }
  }

  @override
  Future<void> signout() {
    // TODO: implement signout
    throw UnimplementedError();
  }

  @override
  Future<void> signup(String email, String password, String fullName)async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // create collection
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'id':userCredential.user?.uid,
        'fullName': fullName,
        'email': email,
      });
      await userCredential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print('Failed to sign up: $e');
    }
  }
}
