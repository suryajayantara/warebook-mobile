import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/themes/colors.dart';

class AccountSelectorCard extends StatelessWidget {
  String? title;
  String? img;
  Color? colors;
  final Function()? onTap;

  AccountSelectorCard(
      {Key? key,
      required this.title,
      required this.img,
      required this.colors,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SvgPicture.asset(
              img.toString(),
              height: 140,
            ),
            Text(
              title.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: ColorsTheme.white,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
