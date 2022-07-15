import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ImagePath.splashBg))),
        width: Get.width,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
          child: SvgPicture.asset(
            ImagePath.whiteLogo,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
