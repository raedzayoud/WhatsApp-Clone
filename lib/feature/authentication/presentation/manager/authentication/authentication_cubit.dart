import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:whatsappclone/feature/authentication/data/repos/authentication_repo.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/register_view.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationRepo authenticationRepo;

  AuthenticationCubit(this.authenticationRepo) : super(AuthenticationInitial());
  Future<void> login(String email, String password) async {
    try {
      emit(AuthenticationLoading());
      await authenticationRepo.login(email, password);
      emit(AuthenticationSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthenticationFailure(
            errorMessage: "No user found for that email"));
      } else if (e.code == 'wrong-password') {
        emit(AuthenticationFailure(
            errorMessage: "Wrong password provided for that user."));
      } else {
        emit(AuthenticationFailure(errorMessage: "Failed to login"));
      }
    }
  }

  Future<void> register(String email, String password, String fullname) async {
    try {
      emit(AuthenticationLoading());
      await authenticationRepo.signup(email, password, fullname);
      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationFailure(errorMessage: e.toString()));
    }
  }

  Future<void> signout(String email, String password, String fullname) async {
    authenticationRepo.signout();
  }
}
