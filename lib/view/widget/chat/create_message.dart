import 'package:flutter/material.dart';

class CreateMessage extends StatelessWidget {
  const CreateMessage( {Key? key, required this.message}) : super(key: key);
final String  message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomStart,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            )),
        child: Text(message),
      ),
    );
  }
}
