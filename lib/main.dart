import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/components/bloc_observe.dart';
import 'package:my_social_app/components/theme.dart';

import 'view/screens/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  runApp( MySocialApp());
}
class MySocialApp extends StatelessWidget{
  const MySocialApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeMode,
      home: LoginScreen(),
    );
  }
}
