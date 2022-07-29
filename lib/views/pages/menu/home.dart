import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/Auth/login_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final _loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Hello World'),
          onPressed: () {
            _loginController.logoutMethod();
          },
        ),
      ),
    );
  }
}
