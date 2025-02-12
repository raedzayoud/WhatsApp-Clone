import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whatsappclone/core/error/failure.dart';
import 'package:whatsappclone/core/utlis/router.dart';
import 'package:whatsappclone/feature/authentication/data/repos/authentication_repo.dart';
import 'package:whatsappclone/feature/authentication/presentation/manager/authentication/authentication_cubit.dart';

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
  Future<Either<Failure, void>> signup(
      String email, String password, String fullName) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user document in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'uid': userCredential.user?.uid,
        'fullName': fullName,
        'email': email,
      });

      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(ServeurFailure(errorsMessage: 'Email already exists'));
      } else {
        return left(
            ServeurFailure(errorsMessage: e.message ?? 'Failed to sign up'));
      }
    } catch (e) {
      return left(ServeurFailure(errorsMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> conncetWithGoole() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return left(
            ServeurFailure(errorsMessage: 'Google sign-in was canceled.'));
      }

      // Obtain authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create credentials
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Sign in to Firebase
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAllNamed(AppRouter.home);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(
          ServeurFailure(errorsMessage: 'FirebaseAuth Error: ${e.message}'));
    } on DioException catch (e) {
      return left(ServeurFailure.fromDioError(e));
    } catch (e) {
      return left(ServeurFailure(errorsMessage: 'Unexpected Error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServeurFailure.fromDioError(e));
      }
      return left(ServeurFailure(errorsMessage: e.toString()));
    }
  }

  
}
