import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/StudentCreativityProgram/student_creativity_program.dart';

class StudentCreativityProgramService extends GetConnect {
  final url_path = NetworkUtility();
  String routeName = "creativity";
  GetStorage dataStorage = GetStorage('auth');

  Future<List<StudentCreativityProgram>> getAll() async {
    return await get(Uri.parse(url_path.serviceUrl() + routeName).toString())
        .then((value) {
      print(value.body["data"]["data"]);
      if (value.body != null && value.isOk) {
        return List<StudentCreativityProgram>.from(value.body["data"]['data']
            .map((e) => StudentCreativityProgram.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  Future<List<StudentCreativityProgram>> getAllByAuth() async {
    String token = dataStorage.read('token');
    return await get(
            Uri.parse(
              url_path.serviceUrl() + routeName + "/auth",
            ).toString(),
            headers: url_path.header(token))
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<StudentCreativityProgram>.from(value.body["data"]['data']
            .map((e) => StudentCreativityProgram.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  

  Future<StudentCreativityProgram> createStudentCreativityProgram(
      FormData form) async {
    return await post(
            Uri.parse(url_path.serviceUrl() + routeName).toString(), form,
            headers: url_path.header(dataStorage.read('token')))
        .then((value) {
      if (value.body != null && value.isOk) {
        return StudentCreativityProgram();
      } else {
        throw "${value.bodyString}";
      }
    });
  }

  Future<StudentCreativityProgram> updateStuedentCreativity(
    FormData form,
    int id,
  ) async {
    String token = dataStorage.read('token');
    return await post(
            Uri.parse(url_path.serviceUrl() + '${routeName}/${id}').toString(),
            form,
            headers: url_path.header(token.toString()))
        .then((value) {
      if (value.body != null && value.isOk) {
        return StudentCreativityProgram();
      } else {
        throw "${value.bodyString} ${value.statusCode}";
      }
    });
  }

  Future<bool> deleteStudentCreativityProgram(id) async {
    String token = dataStorage.read('token');
    return await delete(
            Uri.parse(url_path.serviceUrl() + routeName + '/${id}').toString(),
            headers: url_path.header(token.toString()))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        return true;
      } else {
        print(value.body);
        return false;
      }
    }).catchError((e) {
      throw e;
    });
  }

  
}
