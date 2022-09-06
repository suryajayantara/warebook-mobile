import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/Journal/journal_document_controller.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Card/organism/document_card.dart';
import 'package:warebook_mobile/views/components/Card/pill.dart';
import 'package:warebook_mobile/views/components/users/user_section.dart';
import 'package:warebook_mobile/views/pages/utils/pdf_view.dart';

class JournalView extends StatelessWidget {
  JournalView({Key? key}) : super(key: key);
  int id = Get.arguments['id'];
  final _journalController = Get.put(JournalDocumentController());

  @override
  Widget build(BuildContext context) {
    _journalController.getAllData();
    _journalController.getJournalDocumentDetails(id);
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
                      text: 'Journal',
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      _journalController.detailsData.year.toString(),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              // Pill(
              //     padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              //     margin: EdgeInsets.symmetric(vertical: 10),
              //     text: thesiscontrollers.detailsData.thesisType),
              Text(
                _journalController.detailsData.title.toString(),
                style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: UserSection(
                      userName:
                          _journalController.detailsData.author.toString(),
                      userDepartement: 'Politeknik Negeri Bali')),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _journalController.detailsData.abstract.toString(),
                      style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: ColorsTheme.black),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: RichText(
                          text: TextSpan(
                              text: 'Kata Kunci : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                    text: _journalController.detailsData.tags,
                                    style: TextStyle(color: Colors.blueAccent))
                              ]),
                        )),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: RichText(
                    text: TextSpan(
                        text: 'DOI : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, color: Colors.black),
                        children: [
                          TextSpan(
                              text: _journalController.detailsData.doi,
                              style: TextStyle(color: Colors.blueAccent))
                        ]),
                  )),

              Container(
                child: DocumentCard(
                  onTap: () {
                    print(_journalController.detailsData.documentUrl);
                    Get.to(() => PDFView(
                        url: _journalController.detailsData.documentUrl
                            .toString()));
                  },
                  title: "Proposal PKM",
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
