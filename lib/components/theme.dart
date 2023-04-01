import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  var themeMode = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        )),
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.pink,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontSize: 20),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 0,
    ),
  );
