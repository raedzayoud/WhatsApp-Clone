import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/core/error/failure.dart';
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
  Future<void> signout() {
    return FirebaseAuth.instance.signOut();
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
      // create collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'uid': userCredential.user?.uid,
        'fullName': fullName,
        'email': email,
      });
      //await userCredential.user?.sendEmailVerification();
      return right(null);
    } catch (e) {
      if(e is DioException){
        return left(ServeurFailure.fromDioError(e));
      }
      return left(ServeurFailure(errorsMessage: e.toString()));
    }
  }
}
