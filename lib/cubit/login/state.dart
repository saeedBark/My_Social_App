abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginChangePageState extends LoginState {}

class LoginChangePasswordShowState extends LoginState {}

/////////// userDataPost/////
class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String model;

  LoginSuccessState(this.model);
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}

