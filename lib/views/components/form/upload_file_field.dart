import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadField extends StatelessWidget {
  // Required Params
  EdgeInsets padding;
  final Function()? ontap;

  // Additional Params
  String? description;

  UploadField(
      {Key? key, required this.padding, required this.ontap, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: ontap,
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.black38,
          radius: Radius.circular(10),
          dashPattern: [15, 15, 15, 15],
          child: Container(
            width: Get.width,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((description != null)
                    ? description.toString()
                    : 'Pilih File')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
