import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/login/state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changPasswordShow() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(LoginChangePasswordShowState());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    print('hi');
    emit(LoginLoadingState());
    print('///////////');
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('///////fgdsfgd////');
      print(value.user!.email);
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      print('///55r4e4544544444444444');
      emit(LoginErrorState(error.toString()));
    });
  }

}
