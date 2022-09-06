import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/controllers/StudentCreativityProgram/student_creativity_program_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_document_controller.dart';
import 'package:warebook_mobile/models/StudentCreativityProgram/student_creativity_program.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Card/organism/title_card.dart';
import 'package:warebook_mobile/views/components/card/organism/document_card.dart';
import 'package:warebook_mobile/views/components/card/pill.dart';
import 'package:warebook_mobile/views/components/users/user_section.dart';
import 'package:warebook_mobile/views/pages/thesis/create_document_thesis.dart';
import 'package:warebook_mobile/views/pages/thesis/create_repo_thesis.dart';
import 'package:warebook_mobile/views/pages/utils/pdf_view.dart';

class StudentCreativityProgramView extends StatelessWidget {
  StudentCreativityProgramView({Key? key}) : super(key: key);
  var urlPath = NetworkUtility();
  int id = Get.arguments["id"];
  // final thesisControllers = Get.put(ThesisController());
  final studentCreativityProgramController =
      Get.find<StudentCreativityProgramController>();

  @override
  Widget build(BuildContext context) {
    studentCreativityProgramController.getAllData();
    studentCreativityProgramController.getStudentCreativityProgramDetails(id);
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
                      text: studentCreativityProgramController
                          .detailsData.aliases,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      studentCreativityProgramController.detailsData.year
                          .toString(),
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
                studentCreativityProgramController.detailsData.title.toString(),
                style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: UserSection(
                      userName: studentCreativityProgramController
                          .detailsData.users?.name
                          .toString(),
                      userDepartement: 'D3 Manajemen Informatika')),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text(
                      studentCreativityProgramController.detailsData.abstract
                          .toString(),
                      style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: ColorsTheme.black),
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
                                    text: studentCreativityProgramController
                                        .detailsData.supervisor,
                                    style: TextStyle(color: Colors.blueAccent))
                              ]),
                        )
)
                  ],
                ),
              ),
              
              Container(
                child: DocumentCard(
                  onTap: () {
                    print(studentCreativityProgramController
                        .detailsData.documentUrl);
                    Get.to(() => PDFView(
                        url: studentCreativityProgramController
                            .detailsData.documentUrl
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
