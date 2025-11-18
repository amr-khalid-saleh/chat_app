import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

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
    }on FirebaseAuthException catch (ex) {
      if(ex.code == "user-not-found"){
        emit(LoginFailureState(errMessage: "user not found"));
      }else if(ex.code == "wrong-password"){
        emit(LoginFailureState(errMessage: "wrong password"));
      }
    }catch(e){
      emit(LoginFailureState(errMessage: "something went wrong"));
    }
  }
}
