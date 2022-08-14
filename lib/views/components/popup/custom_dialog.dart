import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/views/components/button/outline_button.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';

class CustomPopUpDialog extends StatelessWidget {
  String title, desc;
  List<Widget> button;
  CustomPopUpDialog(
      {Key? key, required this.title, required this.desc, required this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 300,
              child: LottieBuilder.asset('assets/images/lottie/ask.json'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Yakin Hapus Data?',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Nunito Sans'),
              ),
            ),
            Text(
              'Datamu akan terhapus beserta dengan dokumen repositorymu',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: button,
              ),
            )
          ]),
    );
  }
}
