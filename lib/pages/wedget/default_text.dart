import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  DefaultText({super.key, this.color,required this.text,this.fontSize,this.fontWiedght });
  String text;
  Color? color;
  double? fontSize;
  FontWeight? fontWiedght;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWiedght,
        fontSize: fontSize,
      ),
    );
  }
}

// Widget defaultText(
//     {required String text,
//     double? fontSize,
//     FontWeight? fontWeidght,
//     Color? color}) {
//   return
//   );
// }