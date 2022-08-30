import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/Search/search_controller.dart';
import 'package:warebook_mobile/helpers/string_formating.dart';
import 'package:warebook_mobile/themes/colors.dart';

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
                onPressed: () {},
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
            return ListView.builder(
              itemCount: _searchController.listData.length,
              itemBuilder: (context, i) {
                return ListTile(
                  onTap: () {
                    // journalTopicController.getJournalTopicDetails(
                    //     journalTopicController.listData[i].id);
                    // Get.to(() => JournalTopicView(), arguments: {
                    //   "id": journalTopicController.listData[i].id
                    // });
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
                      ? Text(stringFormating.truncateWithEllipsis(60,
                          _searchController.listData[i].description.toString()))
                      : Text(stringFormating.truncateWithEllipsis(60,
                          _searchController.listData[i].abstract.toString())),
                  isThreeLine: true,
                );
              },
            );
          })),
    );
  }
}
