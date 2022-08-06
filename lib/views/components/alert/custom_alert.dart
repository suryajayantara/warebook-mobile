import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Hello World'),
    );
  }
}
