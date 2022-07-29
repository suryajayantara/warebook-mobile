import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/card/organism/account_selector.dart';
import 'package:warebook_mobile/views/pages/auth/register.dart';

class SelectAccountTypeView extends StatelessWidget {
  const SelectAccountTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: ListView(
          shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      ImagePath.whiteLogo,
                      width: 200,
                      color: Colors.blue,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jenis Akun',
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w800,
                                color: Colors.black38),
                          ),
                          Text(
                            'Tentukan Jenis Akun yang Anda Pilih',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AccountSelectorCard(
                            title: 'Mahasiswa',
                            colors: ColorsTheme.lightYellow,
                            img: ImagePath.StudentSelector,
                            onTap: () {
                              Get.to(RegisterPage(type: 'student'));
                            },
                          ),
                          AccountSelectorCard(
                            colors: ColorsTheme.lightBlue,
                            title: 'Pengajar',
                            img: ImagePath.lectureSelector,
                            onTap: () {
                              Get.to(RegisterPage(type: 'lecture'));
                            },
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        )),
      ),
    );
  }
}
