import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/models/users.dart';
import 'package:warebook_mobile/services/auth_service.dart';

class UserController extends GetxController {
  GetStorage dataStorage = GetStorage('auth');
  final _authService = new AuthService();

  void onInit() {
    super.onInit();
    // getUserDetail();
  }

  Future<Users> getUserDetail() async {
    String token = dataStorage.read('token');

    return _authService
        .getUserDetail(
            token.toString())
        .then((value) {
      return value;
    });
  }
}
