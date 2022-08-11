import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutlineButton extends StatelessWidget {
  final Function()? onTap;
  Color color, textColor;
  String? title;
  double height, width;
  OutlineButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.color,
      required this.textColor,
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
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          title.toString(),
          style: TextStyle(color: textColor),
        )),
      ),
    );
  }
}
