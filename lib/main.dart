import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/views/onboarding.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/dashboard.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/myrepository/lecturer_repository.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/myrepository/student_repository.dart';


void main(List<String> args) async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final dataStorage = GetStorage('auth');

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: (dataStorage.read('token') == null)
          ? OnboardingView()
          : DashboardPage(),
      // home: ThesisCreateView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
    );
  }
}
