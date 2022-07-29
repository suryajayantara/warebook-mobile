import 'package:flutter/material.dart';

class NormalField extends StatelessWidget {
  final TextEditingController? controller;
  String Function(String?)? validate;
  String? hintText;
  String? label;
  NormalField(
      {Key? key,
      required this.validate,
      required this.controller,
      required this.hintText,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(label.toString()),
          hintText: hintText),
    );
  }
}
