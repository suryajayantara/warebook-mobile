import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/views/components/SolidButton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SvgPicture.asset(
                'assets/images/white-icon.svg',
                height: 40,
                color: Colors.blue,
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang !",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Masuk untuk mengakses konten",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Form(
                        child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Username or Email",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                        )
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      width: 150,
                      child: SolidButton(
                        title: "Masuk",
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: GestureDetector(
                      child: Text(
                        'Lupa Password ?',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.blue),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Column(
                      children: [
                        Container(
                          height: 1,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Belum punya akun ?",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            ' Buat Akun',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
