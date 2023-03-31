import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/register/state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changPasswordShow() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordShowState());
  }

  // late UserLoginModel model;
  // void userLogin({
  //   required email,
  //   required password,
  //   required phone,
  //   required name,
  // }) {
  //   emit(RegisterLoadingState());
  //   DioHelper.postData(url: 'register', data: {
  //     'email': email,
  //     'password': password,
  //     'name': name,
  //     'phone': phone
  //   }).then((value) {
  //     model = UserLoginModel.fromJson(value.data);

  //     emit(RegisterSuccessState(model));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(RegisterErrorState(error.toString()));
  //   });
  // }
}
