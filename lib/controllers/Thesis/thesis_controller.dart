import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/thesis/thesis.dart';
import 'package:warebook_mobile/services/thesis_service.dart';
import 'package:warebook_mobile/views/pages/thesis/thesis_view.dart';

class ThesisController extends GetxController {
  // Obs Variables
  var statusData = false;
  var filename = "".obs;

  // Data
  final listData = <Thesis>[].obs;

  // Text Editing Controller
  TextEditingController title = TextEditingController();
  TextEditingController tags = TextEditingController();
  TextEditingController abstract = TextEditingController();

  // File Setting
  FilePickerResult? data;

  // Service
  final thesisService = new ThesisService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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

  void addData() async {
    File file = File(data!.files.single.path!);
    String fileName = file.path.split('/').last;
    filename.value = fileName;
    thesisService
        .addThesis(
            Thesis(
                thesisType: 'Tugas Akhir',
                tags: tags.value.text,
                title: title.value.text,
                abstract: abstract.value.text),
            await file.readAsBytes(),
            fileName)
        .then((value) {
      print(value);
      // Get.off(ThesisView(), arguments: value);
    }).catchError((e) {
      print(e);
    });

    // Show Details Data
  }
}
