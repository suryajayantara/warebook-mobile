import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/StudentCreativityProgram/student_creativity_program.dart';
import 'package:warebook_mobile/services/student_creativity_program_service.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/myrepository/student_repository.dart';

class StudentCreativityProgramController extends GetxController {
 
  
  final service = StudentCreativityProgramService();

  TextEditingController creativityType = TextEditingController();
  TextEditingController aliases = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController abstract = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController supervisor = TextEditingController();

  final listData = <StudentCreativityProgram>[].obs;
  StudentCreativityProgram detailsData = StudentCreativityProgram();
  FilePickerResult? getDocument;


  @override
  void onInit() {
    super.onInit();
    getAllData();
  }

  void getAllData() async {
    return service.getAll().then((value) {
      listData.assignAll(value);

    }).catchError((e) {
      throw "$e";
    });
  }

  StudentCreativityProgram getStudentCreativityProgramDetails(id) {
    return detailsData = listData.firstWhere((element) => element.id == id);
  }



  void createStudentCreativityProgram() async {
    File documentFile = File(getDocument!.files.single.path.toString());

    MultipartFile multipartDocument = MultipartFile(
        await documentFile.readAsBytes(),
        filename: getDocument!.files.single.name);

    FormData form = FormData({
      'creativity_type': creativityType.value.text,
      'aliases': aliases.value.text,
      'title': title.value.text,
      'abstract': abstract.value.text,
      'year': year.value.text,
      'supervisor': supervisor.value.text,
      'document_url': multipartDocument
    });

    service.createStudentCreativityProgram(form).then((value) {
      getAllData();
      Get.to(() => MyRepositoryPage(
            activePage: 1,
          ));
    }).catchError((e) {
      throw e;
    });
  }

  void editData(int id) {
    detailsData = listData.firstWhere((element) => element.id == id);
    creativityType.text = detailsData.creativityType.toString();
    aliases.text = detailsData.aliases.toString();
    title.text = detailsData.title.toString();
    abstract.text = detailsData.abstract.toString();
    year.text = detailsData.year.toString();
    supervisor.text = detailsData.supervisor.toString();
  }

  void updateData(id) async {
    FormData formData = FormData({
      'creativity_type': creativityType.value.text,
      'aliases': aliases.value.text,
      'title': title.value.text,
      'abstract': abstract.value.text,
      'year': year.value.text,
      'supervisor': supervisor.value.text,
    });

    if (getDocument != null) {
      File documentFile = File(getDocument!.files.single.path.toString());
      MultipartFile multipartDocument = MultipartFile(
          await documentFile.readAsBytes(),
          filename: getDocument!.files.single.name);

      formData.files.add(MapEntry('document_url', multipartDocument));
    }

    service.updateStuedentCreativity(formData, id).then((value) {
      getAllData();
      Get.to(MyRepositoryPage(
        activePage: 1,
      ));
    }).catchError((e) {});
  }


  // Delete Data
  Future<bool> deleteStudentCreativityProgram(id) async {
    return await service.deleteStudentCreativityProgram(id).then((value) {
      getAllData();
      if (value) {
        return true;
      } else {
        return false;
      }
    }).catchError((e) {
      throw e;
    });
  }

}
