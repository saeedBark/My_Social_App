
import 'package:flutter/material.dart';
class DefaultText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
   DefaultText({
     required this.text,
      this. color,
   this. fontWeight,
    this. fontSize,
   });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
    );
  }
}
