import 'package:flutter/material.dart';
import 'package:warebook_mobile/views/onboarding.dart';
import 'package:warebook_mobile/views/splashscreen.dart';
import 'package:warebook_mobile/views/thesis/thesis_view.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThesisView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
    );
  }
}
