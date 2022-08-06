import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/StudentCreativityProgram/student_creativity_program.dart';
import 'package:warebook_mobile/services/student_creativity_program_service.dart';

class StudentCreativityProgramController extends GetxController {
 
  TextEditingController creativityType = TextEditingController();
  TextEditingController aliases = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController abstract = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController supervisor = TextEditingController();


  final listData = <StudentCreativityProgram>[].obs;


  final service = new StudentCreativityProgramService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllData();
  }

  void getAllData() async {
    return service.getAll().then((value) {
      listData.assignAll(value);
      print(value);
    }).catchError((e) {
      throw "$e";
    });
  }
}
