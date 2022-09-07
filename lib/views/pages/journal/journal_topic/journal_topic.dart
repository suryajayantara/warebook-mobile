import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/controllers/Journal/journal_document_controller.dart';
import 'package:warebook_mobile/controllers/Journal/journal_topic_controller.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/card/organism/document_card.dart';
import 'package:warebook_mobile/views/components/card/pill.dart';
import 'package:warebook_mobile/views/components/users/user_section.dart';
import 'package:warebook_mobile/views/pages/journal/journal.dart';
import 'package:warebook_mobile/views/pages/utils/pdf_view.dart';

class JournalTopicView extends StatefulWidget {
  const JournalTopicView({Key? key}) : super(key: key);

  @override
  State<JournalTopicView> createState() => _JournalTopicViewState();
}

class _JournalTopicViewState extends State<JournalTopicView> {
  var urlPath = NetworkUtility();
  int id = Get.arguments["id"];

  final journalTopicController = Get.find<JournalTopicController>();
  final journalDocumentController = Get.put(JournalDocumentController());

  @override
  Widget build(BuildContext context) {
    journalTopicController.getAllData();
    journalTopicController.getJournalTopicDetails(id);
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
                      text: 'Journal  ',
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                ],
              ),
              Text(
                journalTopicController.detailsData.title.toString(),
                style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: ColorsTheme.black),
              ),
              // Container(
              //     margin: EdgeInsets.symmetric(vertical: 10),
              //     child: UserSection(
              //         userName: 'Risa Rynanda',
              //         userDepartement: 'D3 Manajemen Informatika')),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text(
                      journalTopicController.detailsData.description.toString(),
                      style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
              Container(
                child: Obx(() {
                  if (!journalDocumentController.isLoading.value) {
                    if (journalDocumentController.listData.length != null &&
                        journalDocumentController.listData.length > 0) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: journalDocumentController.listData.length,
                        itemBuilder: (ctx, i) {
                          return DocumentCard(
                              onTap: () {
                                Get.to(() => JournalView(), arguments: {
                                  'id': journalDocumentController.listData[i].id
                                });
                              },
                              title: journalDocumentController.listData[i].title
                                  .toString(),
                              desc: journalDocumentController
                                  .listData[i].abstract
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
