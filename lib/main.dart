import 'package:flutter/material.dart';
import 'package:warebook_mobile/views/createRepository.dart';
import 'package:warebook_mobile/views/onboarding.dart';
import 'package:warebook_mobile/views/register.dart';
import 'package:warebook_mobile/views/splashscreen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Registerpage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
    );
  }
}
