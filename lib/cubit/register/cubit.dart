import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/register/state.dart';
import 'package:my_social_app/models/user_model.dart';

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

  late UserModel userModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(
        name: name,
        email: email,
        uid: value.user!.uid,
        phone: phone,
      );
      print(value.user!.email);

    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

///// create user /////
  void createUser({
    required String name,
    required String email,
    required String uid,
    required String phone,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(userModel.toMap())
        .then((value) {
      emit(RegisterCreateUserSuccessState());
    }).catchError((error) {
      emit(RegisterCreateUserErrorState());
    });
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
