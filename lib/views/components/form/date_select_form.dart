import 'package:flutter/material.dart';

class DateSelectForm extends StatelessWidget {
  Function()? onTap;
  final TextEditingController? controller;
  final EdgeInsets padding;
  String? label;
  String? hint;
  final Icon;
  DateSelectForm(
      {Key? key,
      required this.onTap,
      required this.Icon,
      required this.controller,
      required this.padding,
      this.label,
      this.hint})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
            icon: Icon,
            border: OutlineInputBorder(),
            label: Text(label.toString()),
            hintText: hint),
        onTap: onTap,
      ),
    );
  }
}
