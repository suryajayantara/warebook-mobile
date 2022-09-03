import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/Auth/user_controller.dart';
import 'package:warebook_mobile/models/thesis/thesis.dart';
import 'package:warebook_mobile/models/users.dart';
import 'package:warebook_mobile/services/thesis_service.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/myrepository/student_repository.dart';


class ThesisController extends GetxController {

  // Text Editing Controller
  TextEditingController title = TextEditingController();
  TextEditingController tags = TextEditingController();
  TextEditingController abstract = TextEditingController();
  TextEditingController createdYear = TextEditingController();

  // Data
  final listData = <Thesis>[].obs;
  Thesis detailsData = Thesis();


  // File Setting
  FilePickerResult? data;

  // Service
  final thesisService = ThesisService();
  final _userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
  }


  void getAllData() async {
    return thesisService.getAll().then((value) {
      listData.assignAll(value);
    }).catchError((e) {
      throw "$e";
    });
  }

  void getAllDataByAuth() async {
    return thesisService.getAllByAuth().then((value) {
      listData.assignAll(value);
    }).catchError((e) {
      throw "$e";
    });
  }

  Thesis getThesisDetails(int id) {
    return detailsData = listData.firstWhere((element) => element.id == id);
  }

  // Simpan Data
  void addData(type) async {
    Users data = await _userController.getUserDetail();

    FormData form = FormData({
      'thesisType': type,
      'tags': tags.value.text,
      'title': title.value.text,
      'author': data.name,
      'abstract': abstract.value.text
    });

    thesisService
        .addThesis(form)
        .then((value) {
      getAllDataByAuth();
      Get.to(MyRepositoryPage(
        activePage: 0,
      ));
    }).catchError((e) {
      throw e;
    });
    // Show Details Data
  }

  void editData(int id) {
    detailsData = listData.firstWhere((element) => element.id == id);
    title.text = detailsData.title.toString();
    abstract.text = detailsData.abstract.toString();
    tags.text = detailsData.tags.toString();
    createdYear.text = detailsData.createdYear.toString();
  }

  void updateData(int id) {
    FormData form = FormData({
      'thesis_type': detailsData.thesisType,
      'tags': tags.value.text,
      'title': title.value.text,
      'abstract': abstract.value.text,
      'created_year': int.parse(createdYear.value.text)
    });

    thesisService.updateThesis(form, id).then((value) {
      getAllDataByAuth();
      Get.to(MyRepositoryPage(
        activePage: 0,
      ));
    }).catchError((e) {
      
    });
  }

  // Delete Data
  Future<bool> deleteThesis(id) async {
    return await thesisService.deleteThesis(id).then((value) {
      getAllDataByAuth();
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
