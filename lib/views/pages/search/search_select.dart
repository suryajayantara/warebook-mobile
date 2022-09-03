import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Card/card.dart';
import 'package:warebook_mobile/views/components/Card/select_search_card.dart';
import 'package:warebook_mobile/views/pages/search/search_type_view.dart';

class SearchSelectorRepository extends StatelessWidget {
  SearchSelectorRepository({Key? key}) : super(key: key);
  GetStorage dataStorage = GetStorage('auth');


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
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: [
                        Text(
                          'Cari di Tipe Repository',
                          style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Pilih Tipe Repository yang akan kamu cari ',
                          style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
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

                  if (dataStorage.read('role') == 'lecture') ...{
                    SelectSearchCard(
                      ontap: () {
                        Get.to(() => SearchTypeViewRepository(),
                            arguments: {'searchType': 'internalResearch'});
                      },
                      margin: EdgeInsets.symmetric(vertical: 0.0),
                      title: 'Penelitian ',
                      urlImage: 'assets/images/search/journal.svg',
                      height: 100,
                      desc: 'Cari Pengabdian yang kamu butuhkan',
                    ),
                  }
                ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
