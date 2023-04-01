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
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error));
    });
  }

  // late UserLoginModel model;
  // void userLogin({
  //   required email,
  //   required password,
  // }) {
  //   emit(LoginLoadingState());
  //   DioHelper.postData(url: 'login', data: {
  //     'email': email,
  //     'password': password,
  //   }).then((value) {
  //     model = UserLoginModel.fromJson(value.data);

  //     emit(LoginSuccessState(model));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(LoginErrorState(error.toString()));
  //   });
  // }
}
