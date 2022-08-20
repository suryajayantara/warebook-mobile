import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/controllers/InternalResearch/internal_research_controller.dart';
import 'package:warebook_mobile/views/components/card/organism/document_card.dart';
import 'package:warebook_mobile/views/components/card/organism/title_card.dart';
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
        body: ListView(
        children: [
          Container(
            child: Stack(children: [
              Container(
                // Content dari Details dimulai disini
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/window-bg.png',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              // Floating Card untuk judul
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TitleCard(
                      type: 'Judul',
                      title: internalResearchController.detailsData.title),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Abstrak",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(internalResearchController
                                      .detailsData.abstract
                                      .toString()),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              children: [
                                DocumentCard(
                                  title: "Dokumen Pengabdian",
                                  desc: "DOkument bla bla",
                                  onTap: () {
                                    //  final
                                    Timer(Duration(seconds: 3), () {
                                      Get.to(
                                          () => PDFView(
                                              url: internalResearchController
                                                  .detailsData.documentUrl
                                                  .toString()),
                                          arguments: {
                                      
                                    });
                                    });
                                  },
                                ),
                                DocumentCard(
                                  title: "Proposal Pengabdian",
                                  desc: "Proposal bla bla",
                                  onTap: () {
                                    //  final
                                    Timer(Duration(seconds: 3), () {
                                      Get.to(
                                          () => PDFView(
                                                url: internalResearchController
                                                    .detailsData.proposalUrl
                                                    .toString(),
                                              ),
                                          arguments: {
                                     
                                    });
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ]),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 35),
                width: Get.width,
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      print('okay, this back');
                    },
                    child: GestureDetector(
                      onTap: () {
                        Get.to(DashboardPage());
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.arrow_back),
                          )),
                    ),
                  )
                ]),
              )
            ]),
          )
        ],
      ),
          ),
    );
  }
}
