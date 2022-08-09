import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/journals/journal_topic.dart';
import 'package:warebook_mobile/services/journal_document_service.dart';
import 'package:warebook_mobile/services/journal_topic_service.dart';

class JournalTopicController extends GetxController {
  final listData = <JournalTopic>[].obs;

  final journalService = new JournalTopicService();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController subject = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllData();
  }

  void getAllData() async {
    return journalService.getAll().then((value) {
      listData.assignAll(value);
      print(value);
    }).catchError((e) {
      throw "$e";
    });
  }

  void create() async {
    journalService
        .createJournalTopic(
      JournalTopic(
        title: title.value.text,
        description: description.value.text,
        subject: subject.value.text,
      ),
    )
        .then((value) {
      print(value);
    });
  }
}
