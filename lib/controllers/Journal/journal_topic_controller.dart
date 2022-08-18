import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/journals/journal_topic.dart';
import 'package:warebook_mobile/services/journal_document_service.dart';
import 'package:warebook_mobile/services/journal_topic_service.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/myrepository/lecturer_repository.dart';

class JournalTopicController extends GetxController {
  final listData = <JournalTopic>[].obs;
  JournalTopic detailsData = JournalTopic();

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

  JournalTopic getJournalTopicDetails(id) {
    return detailsData = listData.firstWhere((element) => element.id == id);
  }

  void create() async {
    FormData form = FormData({
      'title': title.value.text,
      'description': description.value.text,
      'subject': subject.value.text,
    });
    journalService
        .createJournalTopic(form)
        .then((value) {
      getAllData();
      Get.to(() => DosenRepositoryPage(
            activePage: 0,
          ));
    });
  }

  void editData(id) {
    detailsData = listData.firstWhere((element) => element.id == id);
    title.text = detailsData.title.toString();
    description.text = detailsData.title.toString();
    subject.text = detailsData.subject.toString();
  }

  void updateData(id) {
    FormData form = FormData({
      'title': title.value.text,
      'description': description.value.text,
      'subject': subject.value.text,
    });

    journalService.updateJournalTopic(form, id).then((value) {
      getAllData();
      Get.to(DosenRepositoryPage(
        activePage: 0,
      ));
    }).catchError((e) {});
  }

  // Delete Data
  Future<bool> deleteJournalTopic(id) async {
    return await journalService.deleteJournalTopic(id).then((value) {
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
