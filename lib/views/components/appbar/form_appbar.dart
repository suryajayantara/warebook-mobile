import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/themes/colors.dart';

class FormAppBar extends StatelessWidget {
  FormAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 40),
        child: SvgPicture.asset(
          ImagePath.whiteLogo,
          color: ColorsTheme.white,
          width: 150,
        ),
      ),
    ]);
  }
}
