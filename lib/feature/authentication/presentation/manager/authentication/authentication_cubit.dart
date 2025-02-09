import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:whatsappclone/core/utlis/router.dart';
import 'package:whatsappclone/feature/authentication/data/repos/authentication_repo.dart';
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
    emit(AuthenticationLoading());
    var response = await authenticationRepo.signup(email, password, fullname);
    response.fold((failure) {
      emit(AuthenticationFailure(errorMessage: failure.errorsMessage));
      print(failure.errorsMessage);
    }, (success) {
      emit(AuthenticationSuccess());
      //Get.offAllNamed(AppRouter.login);
    });
    }

  Future<void> signout() async {
    await authenticationRepo.signout();
    emit(AuthenticationInitial());
    Get.offAllNamed(AppRouter.login);
  }
}
