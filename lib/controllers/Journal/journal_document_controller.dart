import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/journals/journal_document.dart';
import 'package:warebook_mobile/models/journals/journal_topic.dart';
import 'package:warebook_mobile/services/journal_document_service.dart';
import 'package:warebook_mobile/views/pages/journal/manage_journal_repo.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/myrepository/lecturer_repository.dart';

class JournalDocumentController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController abstract = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController tags = TextEditingController();
  TextEditingController originalUrl = TextEditingController();
  TextEditingController doi = TextEditingController();
  FilePickerResult? getDocument;

  var isLoading = false.obs;
  final listData = <JournalDocument>[].obs;
  JournalDocument detailsData = JournalDocument();
  final service = JournalDocumentService();
  

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

  
  JournalDocument getJournalDocumentDetails(int id) {
    return detailsData = listData.firstWhere((element) => element.id == id);
  }


  void editThesisDocument(id) {
    detailsData = listData.firstWhere((element) => element.id == id);
    title.text = detailsData.title.toString();
    author.text = detailsData.author.toString();
    abstract.text = detailsData.abstract.toString();
    year.text = detailsData.year.toString();
    tags.text = detailsData.tags.toString();
    originalUrl.text = detailsData.originalUrl.toString();
    doi.text = detailsData.doi.toString();
  }

  void create(id) async {
    File documentFile = File(getDocument!.files.single.path.toString());

    MultipartFile multipartDocument = MultipartFile(
        await documentFile.readAsBytes(),
        filename: getDocument!.files.single.name);

    FormData form = FormData({
      'journal_topics_id': id,
      'title': title.value.text,
      'author': author.value.text,
      'abstract': abstract.value.text,
      'year': year.value.text,
      'tags': tags.value.text,
      'original_url': originalUrl.value.text,
      'doi': doi.value.text,
      'document_url': multipartDocument,
    });

    service.createJournalDocument(form).then((value) {
      getAllData();
      Get.to(() => DosenRepositoryPage(
            activePage: 0,
          ));
    }).catchError((e) {
      throw e;
    });
  }

  void updateJournalDocument(id, idJournalTopic) async {
    File documentFile = File(getDocument!.files.single.path.toString());

    MultipartFile multipartDocument = MultipartFile(
        await documentFile.readAsBytes(),
        filename: getDocument!.files.single.name);

    FormData form = FormData({
      'title': title.value.text,
      'author': author.value.text,
      'abstract': abstract.value.text,
      'year': year.value.text,
      'tags': tags.value.text,
      'original_url': originalUrl.value.text,
      'doi': doi.value.text,
      'document_url': multipartDocument,
    });

    if (getDocument != null) {
      File documentFile = File(getDocument!.files.single.path.toString());
      MultipartFile multipartDocument = MultipartFile(
          await documentFile.readAsBytes(),
          filename: getDocument!.files.single.name);

      form.files.add(MapEntry('document_url', multipartDocument));
    }

    service.updateJournalDocument(form, id).then((value) {
      getAllData();
      Get.to(() => ManageJournalRepo(), arguments: {'id': idJournalTopic});
    }).catchError((e) {
      throw e;
    });
  }

}
