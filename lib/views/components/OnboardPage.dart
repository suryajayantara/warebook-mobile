import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardPage extends StatelessWidget {
  String? title;
  String? desc;
  String? imgUrl;
  OnboardPage(
      {Key? key, required this.title, required this.desc, required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(imgUrl.toString()),
          Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                Text(
                  title.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 60),
                  child: Text(
                    desc.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
