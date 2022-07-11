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
