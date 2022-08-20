import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warebook_mobile/commons/asset_path.dart';

class RegisterPage extends StatelessWidget {
  String? type;
  RegisterPage({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            shrinkWrap: true,
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
                              'Selamat Datang !',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black38),
                            ),
                            Text(
                              'Masuk untuk mengakses konten',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
