import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/thesis/thesis.dart';
import 'package:warebook_mobile/models/thesis/thesis_document.dart';
import 'package:warebook_mobile/services/thesis_document_service.dart';
import 'package:warebook_mobile/services/thesis_service.dart';
import 'package:warebook_mobile/views/pages/menu/my_repository.dart';
import 'package:warebook_mobile/views/pages/thesis/thesis_view.dart';

class ThesisDocumentController extends GetxController {
  // Obs Variables
  var statusData = false;
  var filename = "".obs;
  var isLoading = false.obs;

  // Data
  final listData = <ThesisDocument>[].obs;

  // Text Editing Controller
  TextEditingController title = TextEditingController();
  TextEditingController tags = TextEditingController();
  TextEditingController abstract = TextEditingController();

  // File Setting
  FilePickerResult? data;

  // Service
  final thesisDocumentService = new ThesisDocumentService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllData();
  }

  // Function for select file from file_picker
  void selectFile() async {
    FilePickerResult? dataDocument = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['jpg']);
    if (dataDocument != null) {
      statusData = true;
      data = dataDocument;
    }
  }

  void getAllData() async {
    return thesisDocumentService.getAll().then((value) {
      listData.assignAll(value);
    }).catchError((e) {
      throw "$e";
    });
  }

  // // Simpan Data
  // void addData() async {
  //   thesisService
  //       .addThesis(
  //           Thesis(
  //               thesisType: 'Tugas Akhir',
  //               tags: tags.value.text,
  //               title: title.value.text,
  //               abstract: abstract.value.text),
  //   )
  //       .then((value) {
  //     getAllData();
  //     Get.offAll(MyRepositoryPage());
  //   }).catchError((e) {
  //     print(e);
  //   });

  // Show Details Data
  // }
}