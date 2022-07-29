import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutlinePillButton extends StatelessWidget {
  final Function()? onTap;
  Widget child;
  Color colors;

  OutlinePillButton(
      {Key? key,
      required this.onTap,
      required this.child,
      required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: colors, width: 2),
              borderRadius: BorderRadius.circular(20)),
          child: child),
    );
  }
}
