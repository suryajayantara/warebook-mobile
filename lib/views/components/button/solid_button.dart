import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SolidButton extends StatelessWidget {
  final Function()? onTap;
  Color color;
  String? title;
  double height, width;
  SolidButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.color,
      this.height = 40,
      this.width = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          title.toString(),
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
