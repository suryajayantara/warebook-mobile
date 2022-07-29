import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  String? text;
  Pill({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
