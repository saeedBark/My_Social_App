import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String? image;
  CardWidget({super.key, this.image}) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
        image!,
        fit: BoxFit.cover,
        height: 180,
        width: double.infinity,
      ),
    );
  }
}
