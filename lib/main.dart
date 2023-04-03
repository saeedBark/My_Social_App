import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/components/bloc_observe.dart';
import 'package:my_social_app/components/theme.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';
import 'package:my_social_app/share_preference/shared_preference.dart';

import 'package:my_social_app/view/screens/layout_screen.dart';

import 'components/component.dart';
import 'view/screens/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceCach.inti();
  await Firebase.initializeApp();
  Widget widget;
  uId = SharedPreferenceCach.getData(key: 'uId');

  if (uId != null) {
    widget = LayoutScreen();
  } else {
    widget = LoginScreen();
  }

  runApp(MySocialApp(
    starWidget: widget,
  ));
}

class MySocialApp extends StatelessWidget {
  final Widget starWidget;

  MySocialApp({super.key, required this.starWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getAllUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeMode,
        home: starWidget,
      ),
    );
  }
}
