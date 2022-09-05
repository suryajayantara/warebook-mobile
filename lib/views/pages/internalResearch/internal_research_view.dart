import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/controllers/InternalResearch/internal_research_controller.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/card/organism/document_card.dart';
import 'package:warebook_mobile/views/components/card/organism/title_card.dart';
import 'package:warebook_mobile/views/components/card/pill.dart';
import 'package:warebook_mobile/views/components/users/user_section.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/dashboard.dart';
import 'package:warebook_mobile/views/pages/utils/pdf_view.dart';

class InternalResearchDetailsPage extends StatelessWidget {
  InternalResearchDetailsPage({Key? key}) : super(key: key);
  var urlPath = NetworkUtility();
  int id = Get.arguments["id"];
  final internalResearchController = Get.find<InternalResearchController>();

  @override
  Widget build(BuildContext context) {
    internalResearchController.getInternalResearctDetails(id);
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
              Row(
                children: [
                  Pill(
                      text: 'Penelitian & Pengabdian',
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                ],
              ),
              // Pill(
              //     padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              //     margin: EdgeInsets.symmetric(vertical: 10),
              //     text: thesiscontrollers.detailsData.thesisType),
              Text(
                internalResearchController.detailsData.title.toString(),
                style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: UserSection(
                      userName: internalResearchController
                          .detailsData.users?.name
                          .toString(),
                      userDepartement: 'D3 Manajemen Informatika')),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text(
                      internalResearchController.detailsData.abstract
                          .toString(),
                      style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: ColorsTheme.black),
                    )
                  ],
                ),
              ),
              Container(
                child: DocumentCard(
                  onTap: () {
                    Get.to(() => PDFView(
                        url: internalResearchController.detailsData.proposalUrl
                            .toString()));
                  },
                  title: "Proposal Penelitian",
                  desc: '',
                ),
              ),
              Container(
                child: DocumentCard(
                  onTap: () {
                    Get.to(() => PDFView(
                        url: internalResearchController.detailsData.documentUrl
                            .toString()));
                  },
                  title: "Dokument Penelitian",
                  desc: '',
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
