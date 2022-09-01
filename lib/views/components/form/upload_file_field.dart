import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';

class UploadField extends StatelessWidget {
  // Required Params
  EdgeInsets padding;
  final Function()? ontap;
  final Function()? showDocument;

  // Additional Params
  String? description;
  bool hasFile;

  UploadField(
      {Key? key,
      required this.padding,
      required this.ontap,
      this.description,
      this.hasFile = false,
      this.showDocument})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: ontap,
        child: DottedBorder(
          
          borderType: BorderType.RRect,
          color: (hasFile) ? ColorsTheme.lightBlue : Colors.black38,
            radius: Radius.circular(10),
          dashPattern: [15, 15, 15, 15],
            child: (!hasFile)
                ? Container(
            width: Get.width,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (description != null)
                    ? Text(
                        description.toString(),
                        style: TextStyle(
                            color: ColorsTheme.lightBlue,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      )
                    : Text(
                        'Pilih File',
                        style: TextStyle(fontSize: 18),
                      )
                
              ],
                    ))
                : Container(
                    height: 120,
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          description.toString(),
                          style: TextStyle(
                              color: ColorsTheme.lightBlue,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: SolidButton(
                              width: 150,
                              height: 40,
                              onTap: showDocument,
                              title: 'Lihat Dokumen',
                              color: ColorsTheme.lightBlue),
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
