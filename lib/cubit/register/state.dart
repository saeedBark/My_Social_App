abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterChangePageState extends RegisterState {}

class RegisterChangePasswordShowState extends RegisterState {}

/////////// userDataPost/////
class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

///////////