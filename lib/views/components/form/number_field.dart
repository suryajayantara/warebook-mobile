import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberField extends StatelessWidget {
  String Function(String?)? validate;
  TextEditingController? controller;
  String? label;
  String? hintText;
  NumberField(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.controller,
      required this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(4)],
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(label.toString()),
          hintText: hintText.toString()),
    );
  }
}
