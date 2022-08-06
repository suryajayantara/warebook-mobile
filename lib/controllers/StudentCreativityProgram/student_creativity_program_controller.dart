import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/StudentCreativityProgram/student_creativity_program.dart';

class StudentCreativityProgramController extends GetxController {
 
  TextEditingController creativityType = TextEditingController();
  TextEditingController aliases = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController abstract = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController supervisor = TextEditingController();


  final listData = <StudentCreativityProgram>[].obs;
}
