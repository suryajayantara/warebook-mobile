import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/themes/colors.dart';

class AuthBottomSheet extends StatelessWidget {
  String? lottieUrl;
  double lottieSize;
  String? title;
  String? desc;
  AuthBottomSheet(
      {Key? key,
      required this.title,
      required this.desc,
      required this.lottieUrl,
      required this.lottieSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            lottieUrl.toString(),
            height: lottieSize,
          ),
          Text(
            title.toString(),
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600),
          ),
          Text(
            desc.toString(),
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
                color: ColorsTheme.lightBlue),
          )
        ],
      ),
    );
  }
}
