import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/thesis.dart';
import 'package:warebook_mobile/services/thesis_service.dart';

class ThesisController extends GetxController {
  // Obs Variables
  var uploadStatus;

  // Text Editing Controller
  TextEditingController title = TextEditingController();
  TextEditingController tags = TextEditingController();
  TextEditingController abstract = TextEditingController();

  // File Setting
  FileType file = FileType.custom;
  FilePickerResult? data;

  // Service
  final thesisService = new ThesisService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void selectFile() async {
    FilePickerResult? dataDocument = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (dataDocument != null) {
      File file = File(dataDocument.files.single.path!);
      String fileName = file.path.split('/').last;
      
      thesisService.addThesis(
          Thesis(
              thesisType: 'Tugas Akhir',
              tags: tags.value.text,
              title: title.value.text,
              abstract: abstract.value.text
          ),
          await file.readAsBytes(),
          fileName);
    }

  }

  


 
}
