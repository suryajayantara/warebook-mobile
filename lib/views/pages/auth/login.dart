import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/Auth/login_controller.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';
import 'package:warebook_mobile/views/pages/auth/select_account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Form(
                              child: Column(
                            children: [
                              CustomInputForm(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  controller: _loginController.email,
                                  hintText: 'Masukan emailmu disini',
                                  label: 'Email'),
                              CustomInputForm(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                label: 'Password',
                                hintText: 'Masukan Passwordmu disini',
                                isPassword: true,
                                controller: _loginController.password,
                                validator: (value) {
                                  if (value == null) {
                                    return 'Tahun Pembuatan Kosong';
                                  } else {
                                    return "";
                                  }
                                },
                              ),
                              SolidButton(
                                onTap: () {
                                  _loginController.loginMethod(
                                      _loginController.email.value.text
                                          .toString(),
                                      _loginController.password.value.text
                                          .toString());
                                },
                                title: "Masuk",
                                color: ColorsTheme.lightBlue,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'belum punya akun? ',
                                    style: TextStyle(
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 15,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Daftar Sekarang',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorsTheme.lightBlue),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.to(() => SelectAccountTypeView());
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
