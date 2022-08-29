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

  InternalResearch getInternalResearctDetails(id) {
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

    var form = FormData({
      'title': title.value.text,
      'abstract': abstract.value.text,
      'budget': budget.value.text,
      'budget_type': budgetType.value.text,
      'contract_number': contractNumber.value.text,
      'project_started_at': projectStartedAt.value.text,
      'project_finish_at': projectFinishAt.value.text,
      'team_member': teamMember.value.text,
      'proposal_url': multipartProposal,
      'document_url': multipartDocument,
    });
    await service
        .createInternalResearch(form)
        .then((value) {
      getAllData();
      Get.to(() => DosenRepositoryPage(
            activePage: 1,
          ));
    }).catchError((e) {
      throw e;
    });
  }

  void editData(id) {
    detailsData = listData.firstWhere((element) => element.id == id);
    title.text = detailsData.title.toString();
    abstract.text = detailsData.abstract.toString();
    budget.text = detailsData.budget.toString();
    budgetType.text = detailsData.budgetType.toString();
    projectStartedAt.text = detailsData.projectStartedAt.toString();
    projectFinishAt.text = detailsData.projectFinishAt.toString();
    contractNumber.text = detailsData.contractNumber.toString();
    teamMember.text = detailsData.teamMember.toString();
  }

  void updateInternalResearch(id) async {
    FormData formData = FormData({
      'title': title.value.text.toString(),
      'abstract': abstract.value.text.toString(),
      'budget': budget.value.text.toString(),
      'budget_type': budgetType.value.text.toString(),
      'contract_number': contractNumber.value.text.toString(),
      'project_started_at': projectStartedAt.value.text.toString(),
      'project_finish_at': projectFinishAt.value.text.toString(),
      'team_member': teamMember.value.text.toString(),
    });

    if (getDocument != null) {
      File documentFile = File(getDocument!.files.single.path.toString());
      MultipartFile multipartDocument = MultipartFile(
          await documentFile.readAsBytes(),
          filename: getDocument!.files.single.name);

      formData.files.add(MapEntry('document_url', multipartDocument));
    }

    if (getProposal != null) {
      File proposalFile = File(getProposal!.files.single.path.toString());
      MultipartFile multipartDocument = MultipartFile(
          await proposalFile.readAsBytes(),
          filename: getProposal!.files.single.name);
      formData.files.add(MapEntry('document_url', multipartDocument));
    }

    service.updateIntenralResearch(formData, id).then((value) {
      getAllData();
      Get.off(() => DosenRepositoryPage(
            activePage: 1,
          ));
    }).catchError((e) {
      throw e;
    });
  }


  // Delete Data
  Future<bool> deleteInternalResearch(id) async {
    return await service.deleteInternalResearch(id).then((value) {
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

