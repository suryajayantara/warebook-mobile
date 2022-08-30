import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Card/card.dart';
import 'package:warebook_mobile/views/components/Card/select_search_card.dart';
import 'package:warebook_mobile/views/pages/search/search_type_view.dart';

class SearchSelectorRepository extends StatelessWidget {
  SearchSelectorRepository({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(children: [
                  SelectSearchCard(
                    ontap: () {
                      Get.to(() => SearchTypeViewRepository(),
                          arguments: {'searchType': 'thesis'});
                    },
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    title: 'Thesis',
                    urlImage: 'assets/images/search/thesis.svg',
                    height: 100,
                    desc: 'Cari Tugas Akhir / Skripsi yang kamu butuhkan',
                  ),
                  SelectSearchCard(
                    ontap: () {
                      Get.to(() => SearchTypeViewRepository(),
                          arguments: {'searchType': 'studentResearch'});
                    },
                    margin: EdgeInsets.symmetric(vertical: 0.15),
                    title: 'PKM',
                    urlImage: 'assets/images/search/pkm.svg',
                    height: 100,
                    desc:
                        'Cari Program Kreativitas Mahasiswa yang kamu butuhkan',
                  ),
                  SelectSearchCard(
                    ontap: () {
                      Get.to(() => SearchTypeViewRepository(),
                          arguments: {'searchType': 'journal'});
                    },
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    title: 'Jurnal',
                    urlImage: 'assets/images/search/journal.svg',
                    height: 100,
                    desc: 'Cari Jurnal yang kamu butuhkan',
                  ),
                ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
