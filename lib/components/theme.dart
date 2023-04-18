import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_social_app/components/colors.dart';

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
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontSize: 15,height: 1.3),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 0,
    ),
  );
