import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/StudentCreativityProgram/student_creativity_program.dart';

class StudentCreativityProgramService extends GetConnect {
  final url_path = NetworkUtility();
  String routeName = "thesis";
  GetStorage dataStorage = GetStorage('auth');

  Future<List<StudentCreativityProgram>> getAll() async {
    return await get(Uri.parse(url_path.serviceUrl() + routeName).toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<StudentCreativityProgram>.from(value.body["data"]
            .map((e) => StudentCreativityProgram.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  

  Future<StudentCreativityProgram> createStudentCreativityProgram(
      StudentCreativityProgram studentCreativityProgram,
      Uint8List fileByte,
      String fileName) async {
    var filePart = MultipartFile(fileByte, filename: fileName);
    var form = FormData({
      'document_url': filePart,
      'creativity_type': studentCreativityProgram.creativityType,
      'aliases': studentCreativityProgram.aliases,
      'title': studentCreativityProgram.title,
      'abstract': studentCreativityProgram.abstract,
      'year': studentCreativityProgram.year,
      'supervisor': studentCreativityProgram.supervisor
    });
    return await post(
            Uri.parse(url_path.serviceUrl() + routeName).toString(), form,
            headers: url_path.header(dataStorage.read('key')))
        .then((value) {
      if (value.body != null && value.isOk) {
        return StudentCreativityProgram.fromJson(value.body['data']);
      } else {
        throw "${value.bodyString}";
      }
    });
  }

  
}
