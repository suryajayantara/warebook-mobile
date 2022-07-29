import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/models/users.dart';
import 'package:warebook_mobile/services/auth_service.dart';

class UserController extends GetxController {
  GetStorage dataStorage = GetStorage('auth');
  final _authService = new AuthService();

  void onInit() {
    super.onInit();
    getUserDetail();
  }

  Future<Users> getUserDetail() async {
    return _authService
        .getUserDetail(
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NmUxZmY2OS04NjVlLTRkMmUtODQwNi1jNjczNzE0YTdiNmIiLCJqdGkiOiJhMmIxYmNmNGZiODNhMjAzNjg1OGQ0NDI2NDYxNzVlM2NkNTgyM2Y3ZjM0ZDZiZmY5MGMwMzc1Y2ZjNjVlYmUxNDcyNjZlMDVhYjA4ZjJhMCIsImlhdCI6MTY1ODk3ODAyNi4yMTI2OTQsIm5iZiI6MTY1ODk3ODAyNi4yMTI2OTgsImV4cCI6MTY1OTA2NDQyNi4yMDc4MTYsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.NS2uCo0Oi98wbyF7g1CSQWS2hxq5GNIl_KLbI3JW_zndvqfih6LI6KajauYO9mill06XyfbYiN7YFyFYIlSPZvK6hAcwJgO6pszt1E5CLmj1ENfnystKCP7j1wcTB_jE4V_kQM-XX755hk6B0cEdIyYZwXa3Gii06wXQOW2U4Msr7BecV4L2ZVcflPu0M7FTRPesFM5RVfdAOsTT7CF5MvI14Q-tSwYE1sPLHTC0mAz5ss3AyEN8Liv-l5UyBeyPrUUKhkFwTS5JHTGrw_0gK4ZysJru6V1bB9ISxKwZMQaCuLqOCgQaHaxFwsOMMNPXouCB_z6EnZNYEZyP_IHBKOUlw0bpPirsFch0g-GtDzrEvUWL7tMKiUIjztS6nDg52kYHQ9pMjnGM3GNL-bjZSiQebeDeX5gbJZWJ7QBqx9ip27GYkiJqgOU4d-RZp8yszKFKor1XM4dERtRZjMmvIE2mi9T_W8V9Xu7i0_2solXn2FniGz2TBAtYNYqU7Tal4Kr8o9w5rFDiBNH0qgl1chBVCvSP1u7bAETtCcPWh5-n9rJtfotPXTmsW73pk_Ov7NVqYHpG0A8UyEv_mYWwjxp5oB6umpyR24ig4xmkBItnQf68NPbhQ-2ytBfL3CVQK4Df3nyX-A9Oj1LO9eSMyZM_19WBng-GieN91347KY0")
        .then((value) {
      print(value);
      return value;
    });
  }
}
