abstract class AuthState {}

class AuthInitialState extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginFailureState extends AuthState {
  String errMessage;

  LoginFailureState({required this.errMessage});
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailureState extends AuthState {
  String errMessage;

  RegisterFailureState({required this.errMessage});
}
