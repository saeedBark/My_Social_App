import 'package:flutter/material.dart';

class DefaultFromFile extends StatelessWidget {
  TextEditingController controller;
  Function? onsumit;
  String? lable;
  IconData? prefix;
  TextInputType? type;
  Function? validator;
  IconData? suffix;
  bool enable;
  Function()? onTap;
  bool isPassword;
  DefaultFromFile({super.key,
    required this.controller,
    this.onsumit,
     this.lable,
     this.prefix,
    this.onTap,
    this.type,
     this.validator,
    this.suffix,
    this.enable = true,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        // onTap: () {
        //   onTap!();
        // },
        keyboardType: type,
        onFieldSubmitted: (d) {
          onsumit!(d);
        },
        validator: (value) => validator!(value),

        enabled: enable,
        decoration: InputDecoration(
          labelText: lable,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null ? Icon(suffix) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
