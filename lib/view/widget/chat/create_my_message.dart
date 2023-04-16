import 'package:flutter/material.dart';

class CreateMyMessage extends StatelessWidget {
  const CreateMyMessage({Key? key, required this.message}) : super(key: key);
final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            )),
        child: Text(message),
      ),
    );
  }
}
