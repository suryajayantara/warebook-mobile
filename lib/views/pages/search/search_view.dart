import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/Journal/journal_topic_controller.dart';
import 'package:warebook_mobile/controllers/Search/search_controller.dart';
import 'package:warebook_mobile/controllers/StudentCreativityProgram/student_creativity_program_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_document_controller.dart';
import 'package:warebook_mobile/helpers/string_formating.dart';
import 'package:warebook_mobile/models/journals/journal_topic.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/pages/journal/journal_topic/journal_topic.dart';
import 'package:warebook_mobile/views/pages/studentResearch/student_research_view.dart';
import 'package:warebook_mobile/views/pages/thesis/thesis_view.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  String typeOfRepos = Get.arguments['typeOfRepos'];

  final _searchController = Get.put(SearchController());
  final stringFormating = StringFormating();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorsTheme.lightBlue,
                )),
            title: SvgPicture.asset(
              ImagePath.smallLogo,
              height: 35,
              color: ColorsTheme.lightBlue,
            ),
          ),
          body: Obx(() {
            if (_searchController.listData.length > 0) {
              return ListView.builder(
                itemCount: _searchController.listData.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      switch (typeOfRepos) {
                        case "thesis":
                          final _thesisController = Get.put(ThesisController());
                          final _thesisDocumentController =
                              Get.put(ThesisDocumentController());

                          Get.to(() => ThesisDetailsPage(), arguments: {
                            "id": _searchController.listData[i].id
                          });
                          // print(_searchController.listData[i].id);
                          break;
                        case "studentResearch":
                          final _studentResearchController =
                              Get.put(StudentCreativityProgramController());
                          Get.to(() => StudentCreativityProgramView(),
                              arguments: {
                                "id": _searchController.listData[i].id
                              });
                          break;
                        case "journal":
                          final _journalController =
                              Get.put(JournalTopicController());
                          Get.to(() => JournalTopicView(), arguments: {
                            "id": _searchController.listData[i].id
                          });
                          break;
                        default:
                      }
                    },
                    leading: SvgPicture.asset(
                      ImagePath.folder,
                      height: 72.0,
                    ),
                    title: Text(
                        stringFormating.truncateWithEllipsis(
                            20, _searchController.listData[i].title.toString()),
                        style: TextStyle(fontFamily: 'Nunito Sans')),
                    subtitle: (typeOfRepos == 'journal')
                        ? Text(stringFormating.truncateWithEllipsis(
                            60,
                            _searchController.listData[i].description
                                .toString()))
                        : Text(stringFormating.truncateWithEllipsis(60,
                            _searchController.listData[i].abstract.toString())),
                    isThreeLine: true,
                  );
                },
              );
            } else {
              return Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 250,
                    child: LottieBuilder.asset(
                        'assets/images/lottie/loading.json'),
                  ),
                  Text('Sedang Mencari Data...')
                ],
              ));
            }
          })),
    );
  }
}
