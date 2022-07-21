import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController? controller;
  String? hintText;
  String? label;
  PasswordField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextFormField(
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

class EmailField extends StatelessWidget {
  final TextEditingController? controller;
  String? hintText;
  String? label;
  EmailField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextFormField(
          showCursor: true,
          autofocus: true,
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
