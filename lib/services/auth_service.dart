import 'package:get/get.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/users.dart';

class AuthService extends GetConnect {
  final url_path = NetworkUtility();


  /* 

    Login Function : Digunakan untuk melakukan login
    Params yang dikirim berupa model Users dari Controller
  
  */
  Future<Users> login(Users user) async {
    return await post(
        Uri.parse(url_path.serviceUrl() + 'login').toString(), user.toJson(),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        }).then((value) {
      // print(url_path.toString() + 'login');
      if (value.isOk && value.body != null) {
        // print(value.body);
        return Users.fromJson(value.body);
      } else {
        throw "${value.statusCode} : ${value.body['message']}";
      }
    }).catchError((e) {
      throw e;
    });
  }

  /*

      Logout Function => Method yang digunakan untuk melakukan Logout
      Param yang dikirim berupakan Token (yang disimpan di GetStorage)
  
   */
  void logout(token) async {
    await get(url_path.serviceUrl() + 'logout', headers: url_path.header(token))
        .then((value) => print(value.body['message']))
        .catchError((e) {
      throw "${e}";
    });
  }


  /*  

      Get User Details Method => Method untuk mengambil data User
      Param yang dikirim berupa token , digunakan untuk mengcheck user mana yang sedang login
      *Jika tidak ada token, maka dianggap user tidak login
      *Jika token sudah expired, maka request token kembali
  
  */

  Future<Users> getUserDetail(token) async {
    return await get(url_path.serviceUrl() + 'getUser',
            headers: url_path.header(token))
        .then(
      (value) {
        return Users.fromJson(value.body);
      },
    ).catchError((e) {
      throw "${e}";
    });
  }

}
