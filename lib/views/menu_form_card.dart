import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Form_Card/card.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';

class FormCard extends StatelessWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Container(
        height: 200,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 40),
            child: SvgPicture.asset(
              ImagePath.whiteLogo,
              color: ColorsTheme.white,
              width: 200,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
            child: CardForm(),
          ),
        ],
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: children2,
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration:
                    BoxDecoration(color: Colors.black12.withOpacity(0.11)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: SolidButton(
                        color: ColorsTheme.white,
                        onTap: () {},
                        title: 'Masukan',
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
