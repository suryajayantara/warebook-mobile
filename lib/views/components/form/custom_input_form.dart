import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputForm extends StatelessWidget {
  // Required Params
  final String hintText;
  // bool? isPassword = false;

  // Aditional Params
  final EdgeInsets padding;
  final TextInputType? inputType;
  final int? maxLenght;
  final int? maxLines;
  final List<TextInputFormatter>? inputTextFormater;
  final String? Function(String?)? validator;

  CustomInputForm(
      {Key? key,
      required this.hintText,
      required this.padding,
      // this.isPassword,
      this.inputType,
      this.maxLines,
      this.maxLenght,
      this.inputTextFormater,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (padding != null) ? padding : EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: inputType,
        inputFormatters: inputTextFormater,
        maxLines: (maxLines != null) ? maxLines : 1,
        maxLength: (maxLenght != null) ? maxLenght : 255,
        validator: validator,
        // obscureText: (isPassword) ? true : false,
        decoration: InputDecoration(
            counterText: "",
            hintText: hintText,
            border: const OutlineInputBorder()),
      ),
    );
  }
}
