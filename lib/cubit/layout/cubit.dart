import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/layout/state.dart';
import '../../components/component.dart';
import '../../models/user_model.dart';
import '../../share_preference/shared_preference.dart';

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
}
