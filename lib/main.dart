import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/views/pages/auth/register.dart';
import 'package:warebook_mobile/views/pages/menu/home.dart';
import 'package:warebook_mobile/views/onboarding.dart';
import 'package:warebook_mobile/views/pages/auth/select_account.dart';
import 'package:warebook_mobile/views/pages/thesis/create_repo_thesis.dart';
import 'package:warebook_mobile/views/splashscreen.dart';
import 'package:warebook_mobile/views/pages/thesis/thesis_view.dart';

void main(List<String> args) async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final dataStorage = GetStorage('auth');
  
  @override
  Widget build(BuildContext context) {
    dataStorage.remove('token');
    return GetMaterialApp(
      // home: (dataStorage.read('token') == null) ? OnboardingView() : HomeView(),
      home: CreatingThesisRepoView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
    );  
  }
}
