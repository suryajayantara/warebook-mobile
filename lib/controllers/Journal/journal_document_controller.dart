import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/journals/journal_document.dart';
import 'package:warebook_mobile/models/journals/journal_topic.dart';
import 'package:warebook_mobile/services/journal_document_service.dart';

class JournalDocumentController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController abstract = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController tags = TextEditingController();
  TextEditingController doi = TextEditingController();

  final listData = <JournalDocument>[].obs;

  final service = new JournalDocumentService();

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
