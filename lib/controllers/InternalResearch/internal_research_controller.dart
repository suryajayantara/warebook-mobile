import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/internalResearch/internal_research.dart';
import 'package:warebook_mobile/services/internal_research_service.dart';

class InternalResearchController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController abstract = TextEditingController();
  TextEditingController budgetType = TextEditingController();
  TextEditingController budget = TextEditingController();
  TextEditingController projectStartedAt = TextEditingController();
  TextEditingController projectFinishAt = TextEditingController();
  TextEditingController contractNumber = TextEditingController();
  TextEditingController teamMember = TextEditingController();
  

  final listData = <InternalResearch>[].obs;

  final service = new internalResearchService();

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