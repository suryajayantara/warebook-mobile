import 'package:flutter/material.dart';
import 'package:warebook_mobile/themes/colors.dart';

class Pill extends StatelessWidget {
  String? text;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Pill({Key? key, this.text, required this.margin, required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          border: Border.all(color: ColorsTheme.lightBlue),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        text.toString(),
        style: TextStyle(
            color: ColorsTheme.lightBlue,
            fontSize: 12,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
