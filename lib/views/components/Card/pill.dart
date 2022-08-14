import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  String? text;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Pill({Key? key, this.text, required this.margin, required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text.toString(),
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900),
      ),
    );
  }
}
