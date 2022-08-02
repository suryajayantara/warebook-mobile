import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardForm extends StatelessWidget {
  const CardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 1,
            )
          ]),
    );
  }
}
