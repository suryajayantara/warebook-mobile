import 'package:flutter/material.dart';
import 'package:warebook_mobile/views/auth/loginPage.dart';
import 'package:warebook_mobile/views/auth/registrationPage.dart';
import 'package:warebook_mobile/views/auth/selectaccount.dart';
import 'package:warebook_mobile/views/dashboard.dart';
import 'package:warebook_mobile/views/onboarding.dart';
import 'package:warebook_mobile/views/splashscreen.dart';
import 'package:warebook_mobile/views/uploadFile.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
    );
  }
}
