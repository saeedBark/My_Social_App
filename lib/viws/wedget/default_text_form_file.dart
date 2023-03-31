import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultFromFile extends StatelessWidget {
  TextEditingController controller;
  Function? onsumit;
  String lable;
  IconData prefix;
  Function()? onTap;
  TextInputType? type;
  Function validator;
  IconData? suffix;
  bool enable;
  bool isPassword;
  DefaultFromFile({
    required this.controller,
    this.onsumit,
    required this.lable,
    required this.prefix,
    this.onTap,
    this.type,
    required this.validator,
    this.suffix,
    this.enable = true,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      onFieldSubmitted: (d) {
        onsumit!(d);
      },
      validator: (value) => validator(value),
      onTap: () {
        onTap!();
      },
      enabled: enable,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null ? Icon(suffix) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
