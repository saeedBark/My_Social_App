
import 'package:flutter/material.dart';
class DefaultText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
   const DefaultText({super.key,
     required this.text,
      this. color,
   this. fontWeight,
    this. fontSize,
     TextStyle? style,
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
