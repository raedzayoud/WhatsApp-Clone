import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> register(String email, String password) async {
    try {
      emit(AuthenticationLoading());
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthenticationSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationFailure(errorMessage: e.toString()));
    }
  }
}
