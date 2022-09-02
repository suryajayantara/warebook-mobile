import 'package:get/get.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/departement.dart';

class DepartementService extends GetConnect {
  final urlPath = NetworkUtility();
  String routeName = "departement";

  Future<List<Departement>> getAllDepartement() async {
    return await get(Uri.parse(urlPath.serviceUrl() + routeName).toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<Departement>.from(
            value.body["data"].map((e) => Departement.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }
}
