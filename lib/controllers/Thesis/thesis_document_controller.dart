import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/thesis/thesis_document.dart';
import 'package:warebook_mobile/services/thesis_document_service.dart';
import 'package:warebook_mobile/views/pages/thesis/thesis_view.dart';
class ThesisDocumentController extends GetxController {
  // Data
  final listData = <ThesisDocument>[].obs;
  ThesisDocument detailsData = ThesisDocument();
  var isLoading = false.obs;
  // Text Editing Controller
  TextEditingController documentName = TextEditingController();
  // File Setting
  FilePickerResult? getDocument;
  // Service
  final thesisDocumentService = ThesisDocumentService();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getByThesisId(id) async {
    isLoading(true);
    try {
      thesisDocumentService.getAllByThesis(id).then((value) {
        listData.assignAll(value);
        isLoading(false);
      }).catchError((e) {
        throw "$e";
      });
    } catch (e) {
      throw e;
    }
  }

  void createThesisDocument(id) async {
    File documentFile = File(getDocument!.files.single.path.toString());

    MultipartFile multipartDocument = MultipartFile(
        await documentFile.readAsBytes(),
        filename: getDocument!.files.single.name);

    FormData form = FormData({
      'thesis_id': id,
      'document_name': documentName.value.text,
      'document_url': multipartDocument
    });

    thesisDocumentService.createThesisDocument(form).then((value) {
      getByThesisId(id);
      Get.off(() => ThesisDetailsPage(), arguments: {'id': id});
    }).catchError((e) {
      throw e;
    });
  }


  
}
