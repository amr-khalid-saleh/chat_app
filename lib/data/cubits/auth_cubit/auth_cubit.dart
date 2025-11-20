import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "user-not-found") {
        emit(LoginFailureState(errMessage: "user not found"));
      } else if (ex.code == "wrong-password") {
        emit(LoginFailureState(errMessage: "wrong password"));
      }
    } catch (e) {
      emit(LoginFailureState(errMessage: "something went wrong"));
    }
  }

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailureState(errMessage: 'weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailureState(errMessage: 'email already in use'));
      }
    } catch (e) {
      emit(RegisterFailureState(errMessage: 'something went wrong'));
    }
  }
}
