import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/thesis/thesis.dart';
import 'package:warebook_mobile/services/thesis_service.dart';
import 'package:warebook_mobile/views/components/popup/custom_dialog.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/myrepository/student_repository.dart';
import 'package:warebook_mobile/views/pages/thesis/thesis_view.dart';

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllData();
  }


  void getAllData() async {
    return thesisService.getAll().then((value) {
      listData.assignAll(value);
    }).catchError((e) {
      throw "$e";
    });
  }

  Thesis getThesisDetails(int id) {
    return detailsData = listData.firstWhere((element) => element.id == id);
  }

  // Simpan Data
  void addData() async {
    thesisService
        .addThesis(
            Thesis(
                thesisType: 'Tugas Akhir',
                tags: tags.value.text,
                title: title.value.text,
                abstract: abstract.value.text),
    )
        .then((value) {
      getAllData();
      Get.offAll(MyRepositoryPage(
        activePage: 0,
      ));
    }).catchError((e) {
      print(e);
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
      getAllData();
      Get.offAll(MyRepositoryPage());
    }).catchError((e) {
      print(e);
    });
  }

  // Delete Data
  Future<bool> deleteThesis(id) async {
    return await thesisService.deleteThesis(id).then((value) {
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
