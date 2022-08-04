import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Card/card.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';

class SimpleForm extends StatelessWidget {
  final Function()? action;
  List<Widget> widgetList;

  SimpleForm({Key? key, required this.widgetList, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    Column(
                      children: [
                        // Konten disini
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 40),
                          child: Container(
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
                            child: Column(
                              children: widgetList,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              child: Container(
                color: ColorsTheme.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: SolidButton(
                        color: ColorsTheme.lightBlue,
                        onTap: action,
                        title: 'Masukan',
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
