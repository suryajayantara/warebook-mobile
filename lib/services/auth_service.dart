import 'package:get/get.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/users.dart';

class AuthService extends GetConnect {
  final url_path = NetworkUtility();

  Future<Users> login(Users user) async {
    // print(url_path.url + 'login');
    // return user;
    return await post(
        Uri.parse(url_path.url + 'login').toString(), user.toJson(),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        }).then((value) {
      // print(url_path.toString() + 'login');
      if (value.isOk && value.body != null) {
        return Users.fromJson(value.body);
      } else {
        throw "${value.statusCode} : ${value.body['message']}";
      }
    }).catchError((e) {
      throw e;
    });
  }

  void logout(token) async {
    await get(url_path.url + 'logout', headers: url_path.header(token))
        .then((value) => print(value.body['message']))
        .catchError((e) {
      throw "${e}";
    });
  }
}
