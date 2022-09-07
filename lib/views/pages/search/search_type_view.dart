import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/Search/search_controller.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';

class SearchTypeViewRepository extends StatelessWidget {
  String searchType = Get.arguments['searchType'];

  SearchTypeViewRepository({Key? key}) : super(key: key);
  final _searchController = Get.put(SearchController());
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
              onPressed: () {Get.back();},
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
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CustomInputForm(
                  icons: Icon(Icons.search),
                  hintText: "Search",
                  label: "Apa yang ingin anda cari?",
                  padding: EdgeInsets.all(0),
                  controller: _searchController.search,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: Get.width,
                child: SolidButton(
                  onTap: () {
                    _searchController.getSearch(searchType);
                  },
                  title: "Cari",
                  color: ColorsTheme.lightBlue,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
