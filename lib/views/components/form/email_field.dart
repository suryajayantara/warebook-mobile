import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  TextEditingController? controller;
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
          validator: (value) {
            bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value.toString());
            if (emailValid) {
              return 'Email Tidak Benar';
            }
          },
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
