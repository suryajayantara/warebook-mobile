import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/Auth/login_controller.dart';
import 'package:warebook_mobile/views/components/form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                          fontSize: 30,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w800,
                          color: Colors.black38),
                    ),
                    Text(
                      'Masuk untuk mengakses konten',
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Form(
                    child: Column(
                  children: [
                    EmailField(
                        controller: _loginController.email,
                        hintText: 'Masukan emailmu disini',
                        label: 'Email'),
                    PasswordField(
                      label: 'Password',
                      hintText: 'Masukan Passwordmu disini',
                      controller: _loginController.password,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _loginController.loginMethod(
                              _loginController.email.value.text.toString(),
                              _loginController.password.value.text.toString());
                        },
                        child: Text('Kirim')),
                  ],
                )),
              )
            ]),
      ),
    );
  }
}
