import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Card/select_search_card.dart';
import 'package:warebook_mobile/views/pages/search/search_type_view.dart';
import 'package:warebook_mobile/views/pages/studentResearch/create_repo_student_creativity_program.dart';
import 'package:warebook_mobile/views/pages/thesis/create_repo_thesis.dart';

class SelectRepositoryTypeView extends StatelessWidget {
  const SelectRepositoryTypeView({Key? key}) : super(key: key);

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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: [
                        Text(
                          'Pilih Tipe Repository',
                          style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Pilih Tipe Repository yang akan kamu upload ',
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
                      Get.to(() => ThesisCreateView(),
                          arguments: {'type': 'Tugas Akhir'});
                    },
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    title: 'Tugas Akhir',
                    urlImage: 'assets/images/search/thesis.svg',
                    height: 100,
                    desc: 'Upload hasil tugas akhirmu disini',
                  ),
                  SelectSearchCard(
                    ontap: () {
                      Get.to(() => ThesisCreateView(),
                          arguments: {'type': 'Skripsi'});
                    },
                    margin: EdgeInsets.symmetric(vertical: 0.15),
                    title: 'Skripsi',
                    urlImage: 'assets/images/search/pkm.svg',
                    height: 100,
                    desc: 'Upload Skripsi yang kamu kerjakan Disini',
                  ),
                  SelectSearchCard(
                    ontap: () {
                      Get.to(() => StudentCreativityProgramCreateView(),
                          arguments: {'searchType': 'journal'});
                    },
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    title: 'PKM',
                    urlImage: 'assets/images/search/journal.svg',
                    height: 100,
                    desc: 'Punya PKM ? Upload Disini',
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
