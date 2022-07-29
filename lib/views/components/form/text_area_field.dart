import 'package:flutter/material.dart';

class TextAreaField extends StatelessWidget {
  String Function(String?)? validate;
  TextEditingController? controller;
  int? maxLines;
  String? hintText;
  String? label;
  TextAreaField(
      {Key? key,
      required this.maxLines,
      required this.label,
      required this.hintText,
      required this.controller,
      required this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      maxLines: maxLines,
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          label: Text(label.toString())),
    );
  }
}
