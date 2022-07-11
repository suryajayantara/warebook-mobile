import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/splash-bg.png'))),
        width: Get.width,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
          child: SvgPicture.asset(
            'assets/images/white-icon.svg',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
