import 'package:flutter/material.dart';

class DefaultBottom extends StatelessWidget {
  Color color;
  double width;
  double raduis;
  bool isUpperCase;
  Function function;
  String text;
   DefaultBottom({super.key,
    this. color = const Color(0xFFD319C2),
    this. width = double.infinity,
    this. raduis = 15,
    this. isUpperCase = true,
    required this. function,
    required this. text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: color,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

/////////
