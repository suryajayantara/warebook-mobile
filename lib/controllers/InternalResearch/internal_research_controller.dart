import 'dart:io';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/Auth/user_controller.dart';
import 'package:warebook_mobile/models/internalResearch/internal_research.dart';
import 'package:warebook_mobile/models/users.dart';
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
  }

  // Get All Data Controller
  void getAllData() async {
    return service.getAll().then((value) {
      listData.assignAll(value);
    }).catchError((e) {
      throw e;
    });
  }

  void getAllDataByAuth() async {
    return service.getAllByAuth().then((value) {
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


    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime date = DateTime.now();
    print(
        "${projectStartedAt.value.text} ${date.hour}:${date.minute}:${date.second}");
    var form = FormData({
      'title': title.value.text,
      'abstract': abstract.value.text,
      'budget': budget.value.text,
      'budget_type': budgetType.value.text,
      'contract_number': contractNumber.value.text,
      'project_started_at': dateFormat.parse(
          "${projectStartedAt.value.text} ${date.hour}:${date.minute}:${date.second}"),
      'project_finish_at': dateFormat.parse(
          "${projectFinishAt.value.text} ${date.hour}:${date.minute}:${date.second}"),
      'team_member': teamMember.value.text,
      'proposal_url': multipartProposal,
      'document_url': multipartDocument,
    });

    await service
        .createInternalResearch(form)
        .then((value) {
      getAllDataByAuth();
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
    contractNumber.text = detailsData.contractNumber.toString();
    teamMember.text = detailsData.teamMember.toString();
  }

  void updateInternalResearch(id) async {

    
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime date = DateTime.now();

    FormData formData = FormData({
      'title': title.value.text.toString(),
      'abstract': abstract.value.text.toString(),
      'budget': budget.value.text.toString(),
      'budget_type': budgetType.value.text.toString(),
      'contract_number': contractNumber.value.text.toString(),
      'project_started_at': dateFormat.parse(
          "${projectStartedAt.value.text} ${date.hour}:${date.minute}:${date.second}"),
      'project_finish_at': dateFormat.parse(
          "${projectFinishAt.value.text} ${date.hour}:${date.minute}:${date.second}"),
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
      getAllDataByAuth();
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
      getAllDataByAuth();
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

