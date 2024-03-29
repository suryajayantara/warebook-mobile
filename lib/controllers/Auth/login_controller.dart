import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/models/users.dart';
import 'package:warebook_mobile/services/auth_service.dart';
import 'package:warebook_mobile/views/components/popup/custom_dialog.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/dashboard.dart';
import 'package:warebook_mobile/views/pages/auth/login.dart';
import 'package:warebook_mobile/views/onboarding.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GetStorage dataStorage = GetStorage('auth');
  final _authService = AuthService();

  // Variable
  String token = "";
  var isLoading = false.obs;

  Future<bool> loginMethod(String email, String password) async {
    
    
    return await _authService
        .login(Users(password: password, email: email))
          .then((value) {
        if (value.token != null) {
          dataStorage.write('token', value.token);
        return true;
      } else {
        return false;
      }


    });

  }

  void logoutMethod() {
    _authService.logout(dataStorage.read('token'));
    dataStorage.remove('token');
    dataStorage.remove('roles');
    Get.offAll(const LoginPage());
  }
}
