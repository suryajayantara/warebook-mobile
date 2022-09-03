import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/StudentCreativityProgram/student_creativity_program_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/services/internal_research_service.dart';
import 'package:warebook_mobile/services/journal_topic_service.dart';
import 'package:warebook_mobile/services/student_creativity_program_service.dart';
import 'package:warebook_mobile/services/thesis_service.dart';
import 'package:warebook_mobile/views/pages/search/search_view.dart';

class SearchController extends GetxController {
  final listData = [].obs;
  TextEditingController search = TextEditingController();

  // Get Service
  final _thesisService = ThesisService();
  final _journalService = JournalTopicService();
  final _studentResearch = StudentCreativityProgramService();
  final _internalResearch = InternalResearchService();
  

  void getSearch(searchType) async {

    String keyword = "";

    final res = [];
    listData.clear();
    switch (searchType) {
      case 'thesis':
        await _thesisService.getAll().then((value) => res.assignAll(value));
        break;
      case 'journal':
        await _journalService.getAll().then((value) => res.assignAll(value));
        break;
      case 'studentResearch':
        await _studentResearch.getAll().then((value) => res.assignAll(value));
        break;
      case 'internalResearch':
        await _internalResearch.getAll().then((value) => res.assignAll(value));
        break;
      default:
    }

    if (search.value.text != null && search.value.text != "") {
      listData.assignAll(res.where((element) =>
          element.title.toString().toLowerCase().contains(search.value.text)));
      keyword = search.value.text;
    } else {
      listData.assignAll(res);
    }

    

    Get.to(() => SearchView(),
        arguments: {'typeOfRepos': searchType, 'keyword': keyword});
  }
}
