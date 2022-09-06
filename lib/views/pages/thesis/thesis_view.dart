import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_document_controller.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Card/organism/title_card.dart';
import 'package:warebook_mobile/views/components/card/organism/document_card.dart';
import 'package:warebook_mobile/views/components/card/pill.dart';
import 'package:warebook_mobile/views/components/users/user_section.dart';
import 'package:warebook_mobile/views/pages/thesis/create_document_thesis.dart';
import 'package:warebook_mobile/views/pages/thesis/create_repo_thesis.dart';
import 'package:warebook_mobile/views/pages/utils/pdf_view.dart';

class ThesisDetailsPage extends StatelessWidget {
  ThesisDetailsPage({Key? key}) : super(key: key);
  var urlPath = NetworkUtility();
  int id = Get.arguments["id"];

  // final thesiscontrollers = Get.put(ThesisController());
  final thesiscontrollers = Get.find<ThesisController>();
  final thesisDocumentController = Get.put(ThesisDocumentController());

  @override
  Widget build(BuildContext context) {
    thesiscontrollers.getAllData();
    thesiscontrollers.getThesisDetails(id);
    thesisDocumentController.getByThesisId(id);


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
              Row(
                children: [
                  Pill(
                      text: 'Tugas Akhir',
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                ],
              ),
              
              Text(
                thesiscontrollers.detailsData.title.toString(),
                style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: ColorsTheme.black),
              ),    
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: UserSection(
                      userName: 'Risa Rynanda',
                      userDepartement: 'D3 Manajemen Informatika')),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      thesiscontrollers.detailsData.abstract.toString(),
                      style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: RichText(
                          text: TextSpan(
                              text: 'Kata Kunci : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                    text: thesiscontrollers.detailsData.tags,
                                    style: TextStyle(color: Colors.blueAccent))
                              ]),
                        )
)
                  ],
                ),
              ),
              Container(
                child: Obx(() {
                  if (!thesisDocumentController.isLoading.value) {
                    if (thesisDocumentController.listData.length != null &&
                        thesisDocumentController.listData.length > 0) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: thesisDocumentController.listData.length,
                        itemBuilder: (ctx, i) {
                          return DocumentCard(
                              onTap: () {
                                Get.to(() => PDFView(
                                      url: thesisDocumentController
                                          .listData[i].url
                                          .toString(),
                                    ));
                              },
                              title: thesisDocumentController
                                  .listData[i].documentName
                                  .toString(),
                              desc: thesisDocumentController
                                  .listData[i].documentName
                                  .toString());
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
                                'assets/images/lottie/nodata.json'),
                          ),
                          Text(
                            'Dokument Belum Tersedia',
                            style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ));
                    }
                  } else {
                    // return Center(child: RefreshIndicator,);
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
                }),
              ),
              
            ],
          ),
        )),
      ),
    );
  }
}
