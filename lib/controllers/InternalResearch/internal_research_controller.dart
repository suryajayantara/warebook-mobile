import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/models/internalResearch/internal_research.dart';
import 'package:warebook_mobile/services/internal_research_service.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/myrepository/lecturer_repository.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

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
  InternalResearch detailsData = InternalResearch();
  final service = InternalResearchService();

  // Variable untuk menyimpan data
  FilePickerResult? getProposal;
  FilePickerResult? getDocument;

  @override
  void onInit() {
    super.onInit();
    getAllData();
  }

  // Get All Data Controller
  void getAllData() async {
    return service.getAll().then((value) {
      listData.assignAll(value);
    }).catchError((e) {
      throw e;
    });
  }

  InternalResearch getInternalResearctDetails(int id) {
    return detailsData = listData.firstWhere((element) => element.id == id);
  }

  /*

        Jangan lupa modifed biar ntar tinggal masukin form data aja di service
  
   */
  void createInternalResearch() async {
    File documentFile = File(getDocument!.files.single.path.toString());
    File proposalFile = File(getProposal!.files.single.path.toString());

    MultipartFile multipartDocument = MultipartFile(
        await documentFile.readAsBytes(),
        filename: getDocument!.files.single.name);
    MultipartFile multipartProposal = MultipartFile(
        await proposalFile.readAsBytes(),
        filename: getProposal!.files.single.name);
    await service
        .createInternalResearch(
            InternalResearch(
                title: title.value.text,
                abstract: abstract.value.text,
                budget: int.parse(budget.value.text),
                budgetType: budgetType.value.text,
                projectStartedAt: DateTime.parse(projectStartedAt.value.text),
                projectFinishAt: DateTime.parse(projectFinishAt.value.text),
                contractNumber: int.parse(contractNumber.value.text),
                teamMember: teamMember.value.text),
            multipartDocument,
            multipartProposal)
        .then((value) {
      getAllData();
      Get.to(() => DosenRepositoryPage());
    }).catchError((e) {
      throw e;
    });
  }

}
