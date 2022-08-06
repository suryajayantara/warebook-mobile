import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/journals/journal_topic.dart';
import 'package:warebook_mobile/services/journal_document_service.dart';
import 'package:warebook_mobile/services/journal_topic_service.dart';

class JournalTopicController extends GetxController {
  final listData = <JournalTopic>[].obs;

  final service = new JournalTopicService();

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
