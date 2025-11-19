import 'package:bloc/bloc.dart';
import 'package:chat_app/data/cubits/register_cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

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
        emit(RegisterFailureState(errMessage: ex.code));

      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailureState(errMessage: ex.code));
      }
    } catch (e) {
      emit(RegisterFailureState(errMessage: 'something went wrong'));
    }
  }
}
