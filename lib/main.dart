import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/views/dashboard.dart';
import 'package:warebook_mobile/views/onboarding.dart';
import 'package:warebook_mobile/views/pages/auth/login.dart';
import 'package:warebook_mobile/views/pages/internalResearch/create_repo_internal_research.dart';
import 'package:warebook_mobile/views/pages/journal/create_repo_journal.dart';
import 'package:warebook_mobile/views/pages/menu/dosen_repository.dart';
import 'package:warebook_mobile/views/pages/menu/home.dart';
import 'package:warebook_mobile/views/pages/menu/my_repository.dart';
import 'package:warebook_mobile/views/pages/studentResearch/create_repo_student_creativity_program.dart';
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
      // home: (dataStorage.read('token') == null)
      //     ? OnboardingView()
      //     : DashboardPage(),
      home: DosenRepositoryPage(),
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
