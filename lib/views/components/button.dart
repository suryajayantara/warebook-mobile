import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SolidButton extends StatelessWidget {
  final Function()? onTap;
  String? title;
  SolidButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: Get.width, minWidth: Get.width, minHeight: 49),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              title.toString(),
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final Function()? onTap;
  String? title;
  OutlineButton({Key? key, required this.onTap, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SolidPillButton extends StatelessWidget {
  final Function()? onTap;
  String? text;
  Color colors;
  SolidPillButton(
      {Key? key, required this.onTap, required this.text, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(20)),
        child: Text(
          text.toString(),
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

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
