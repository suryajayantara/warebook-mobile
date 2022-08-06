import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/models/users.dart';
import 'package:warebook_mobile/services/auth_service.dart';
import 'package:warebook_mobile/views/dashboard.dart';
import 'package:warebook_mobile/views/pages/menu/home.dart';
import 'package:warebook_mobile/views/pages/auth/login.dart';
import 'package:warebook_mobile/views/onboarding.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GetStorage dataStorage = GetStorage('auth');
  final _authService = new AuthService();
  
  // Variable
  var token;
  bool isLoading = false.obs();

  void loginMethod(String email, String password) async {
    await _authService
        .login(Users(password: password, email: email))
        .then((value) {
      // isLoading = true;
      if (value.token != null) {
        dataStorage.write('token', value.token);
        Get.to(DashboardPage());
      }
    });
  }

  void logoutMethod() {
    _authService.logout(dataStorage.read('token'));
    dataStorage.remove('token');
    Get.offAll(LoginPage());
  }
}
