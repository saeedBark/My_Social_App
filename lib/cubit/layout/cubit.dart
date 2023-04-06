

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/cubit/layout/state.dart';
import '../../components/component.dart';
import '../../models/user_model.dart';
import '../../view/screens/layout/chat.dart';
import '../../view/screens/layout/feed.dart';
import '../../view/screens/layout/setting.dart';
import '../../view/screens/layout/users.dart';


class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void getAllUser() {
    emit(LayoutGetAllUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());

      userModel = UserModel.formjson(value.data()!);

      print(userModel!.name);

      emit(LayoutGetAllUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetAllUserErrorState());
    });
  }

int currendIndex = 0;

  void changeBottom( int index){

    currendIndex = index;
    emit(LayoutChangeBottomState());
  }

  List<Widget> screens =  [
     FeedScreen(),
    ChatScreen(),
    UsersScreen(),
    SettingScreen(),
  ];
  List<String> title = [

    'Home',
    'Chat',
    'Users',
    'Setting',
  ];
  List<BottomNavigationBarItem> bottomNavigaton = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Feed'),
    BottomNavigationBarItem(icon: Icon(Icons.chat_outlined),label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(Icons.person),label: 'User'),
    BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: 'Setting'),
  ];


  File? profileimage;
  var picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        profileimage = File(pickedFile.path);
        emit(LayoutPickeProfileImageSuccessState());
      } else {
        emit(LayoutPickeProfileImageErrorState());
      }

  }
}
