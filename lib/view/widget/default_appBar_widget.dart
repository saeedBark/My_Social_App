import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key,required this.action, required this.text}) : super(key: key);
final List<Widget> action ;
final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      actions: action,
    );
  }
}
