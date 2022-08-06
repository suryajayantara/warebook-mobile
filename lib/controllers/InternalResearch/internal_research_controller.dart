import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/internalResearch/internal_research.dart';

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
}