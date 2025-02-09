import 'package:dartz/dartz.dart';
import 'package:whatsappclone/core/error/failure.dart';

abstract class AuthenticationRepo {
   Future<void>login(String email, String password);
   Future<Either<Failure, void>>signup(String email, String password,String fullName);
   Future<Either<Failure, void>>forgetPassword(String email);
   Future<Either<Failure, void>>conncetWithGoole();
   Future<void>signout();
   Future<void>sigwithgoogle();
}