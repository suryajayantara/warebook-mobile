import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController? controller;
  String Function(String?)? validate;
  String? hintText;
  String? label;
  PasswordField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.label,
      required this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextFormField(
          validator: validate,
          showCursor: true,
          autofocus: true,
          obscureText: true,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: label.toString(),
            border: OutlineInputBorder(),
            alignLabelWithHint: true,
          )),
    );
  }
}
