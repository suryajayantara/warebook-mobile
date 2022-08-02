import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/views/menu_form_card.dart';
import 'package:warebook_mobile/views/pages/thesis/create_repo_thesis.dart';

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
      // home: (dataStorage.read('token') == null) ? OnboardingView() : HomeView(),
      home: FormCard(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
    );
  }
}
