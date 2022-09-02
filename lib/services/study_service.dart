import 'package:get/get.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/departement.dart';
import 'package:warebook_mobile/models/study.dart';

class StudyService extends GetConnect {
  final urlPath = NetworkUtility();
  String routeName = "study";

  Future<List<Study>> getStudyById(id) async {
    print(Uri.parse(urlPath.serviceUrl() + routeName + "/departement/${id}")
        .toString());
    return await get(
            Uri.parse(urlPath.serviceUrl() + routeName + "/departement/${id}")
                .toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        print(value.body);
        return List<Study>.from(
            value.body["data"].map((e) => Study.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }
}
