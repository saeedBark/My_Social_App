import 'package:flutter/material.dart';

Future navigatorAndReplace(context , widget) =>  Navigator.
pushAndRemoveUntil(context, MaterialPageRoute(builder: (contex) => widget ), (route) => false);

///////////////
Future navigatorTo(context , widget) =>  Navigator.
push(context, MaterialPageRoute(builder: (contex) => widget ),);