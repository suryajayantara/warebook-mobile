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

class ThesisDetailsPage extends StatelessWidget {
  ThesisDetailsPage({Key? key}) : super(key: key);
  var urlPath = NetworkUtility();
  int id = Get.arguments["id"];
  // final thesisControllers = Get.put(ThesisController());
  final thesiscontrollers = Get.find<ThesisController>();
  final thesisDocumentController = Get.put(ThesisDocumentController());

  @override
  Widget build(BuildContext context) {
    thesiscontrollers.getThesisDetails(id);
    thesisDocumentController.getByThesisId(id);
    // return Scaffold(
    //     floatingActionButton: FloatingActionButton(
    //       child: Icon(Icons.file_upload_rounded),
    //       onPressed: () {
    //         Get.to(ThesisDocumentCreateView(),
    //             arguments: {'id': thesiscontrollers.detailsData.id});
    //       },
    //     ),
    //     body: ListView(
    //       children: [
    //         Container(
    //           child: Stack(children: [
    //             Container(
    //               // Content dari Details dimulai disini
    //               child: Column(
    //                 children: [
    //                   Image.asset(
    //                     'assets/images/window-bg.png',
    //                     height: 250,
    //                     width: double.infinity,
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             // Floating Card untuk judul
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 TitleCard(
    //                   title:
    //                       thesiscontrollers.detailsData.title,
    //                   type: thesiscontrollers.detailsData.thesisType,
    //                 ),
    //                 Container(
    //                   margin:
    //                       EdgeInsets.symmetric(horizontal: 35, vertical: 20),
    //                   child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Abstrak",
    //                           style: TextStyle(
    //                               fontSize: 25,
    //                               fontFamily: 'Nunito Sans',
    //                               fontWeight: FontWeight.w700),
    //                         ),
    //                         Container(
    //                             margin: EdgeInsets.only(top: 20),
    //                             child: Column(
    //                               children: [
    //                                 Text(
    //                                     thesiscontrollers.detailsData.abstract
    //                                     .toString()),
    //                               ],
    //                             )),
    //                         Container(
    //                           margin: EdgeInsets.symmetric(vertical: 20),
    //                           child: Text(
    //                               "Kata Kunci : ${thesiscontrollers.detailsData.tags}"),
    //                         ),
    //                         Container(
    //                             margin: EdgeInsets.symmetric(vertical: 25),
    //                             child: Obx(() {
    //                               if (!thesisDocumentController
    //                                   .isLoading.value) {
    //                                 if (thesisDocumentController
    //                                             .listData.length !=
    //                                         null &&
    //                                     thesisDocumentController
    //                                             .listData.length >
    //                                         0) {
    //                                   return ListView.builder(
    //                                     shrinkWrap: true,
    //                                     itemCount: thesisDocumentController
    //                                         .listData.length,
    //                                     itemBuilder: (ctx, i) {
    //                                       return DocumentCard(
    //                                           onTap: () {},
    //                                           title: thesisDocumentController
    //                                               .listData[i].documentName
    //                                               .toString(),
    //                                           desc: thesisDocumentController
    //                                               .listData[i].documentName
    //                                               .toString());
    //                                     },
    //                                   );
    //                                 } else {
    //                                   return Center(
    //                                       child: Column(
    //                                     mainAxisSize: MainAxisSize.min,
    //                                     children: [
    //                                       SizedBox(
    //                                         height: 250,
    //                                         child: LottieBuilder.asset(
    //                                             'assets/images/lottie/nodata.json'),
    //                                       ),
    //                                       Text(
    //                                         'Dokument Belum Tersedia',
    //                                         style: TextStyle(
    //                                             fontFamily: 'Nunito Sans',
    //                                             fontSize: 16,
    //                                             fontWeight: FontWeight.w700),
    //                                       )
    //                                     ],
    //                                   ));
    //                                 }
    //                               } else {
    //                                 // return Center(child: RefreshIndicator,);
    //                                 return Center(
    //                                     child: Column(
    //                                   mainAxisSize: MainAxisSize.min,
    //                                   children: [
    //                                     SizedBox(
    //                                       height: 250,
    //                                       child: LottieBuilder.asset(
    //                                           'assets/images/lottie/loading.json'),
    //                                     ),
    //                                     Text('Sedang Mencari Data...')
    //                                   ],
    //                                 ));
    //                               }
    //                             }))
    //                       ]),
    //                 )
    //               ],
    //             ),
    //             Container(
    //               margin: EdgeInsets.symmetric(vertical: 30, horizontal: 35),
    //               width: Get.width,
    //               child: Row(children: [
    //                 GestureDetector(
    //                   onTap: () {
    //                     print('okay, this back');
    //                   },
    //                   child: GestureDetector(
    //                     onTap: () {
    //                       Get.to(ThesisCreateView());
    //                     },
    //                     child: Container(
    //                         decoration: BoxDecoration(
    //                             color: Colors.white.withOpacity(0.2),
    //                             borderRadius: BorderRadius.circular(20)),
    //                         child: Padding(
    //                           padding: EdgeInsets.all(10),
    //                           child: Icon(Icons.arrow_back),
    //                         )),
    //                   ),
    //                 )
    //               ]),
    //             )
    //           ]),
    //         )
    //       ],
    //     ));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
              Text(
                thesiscontrollers.detailsData.title.toString(),
                style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontSize: 22,
                    fontWeight: FontWeight.w800),
              ),
              Pill(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  text: thesiscontrollers.detailsData.thesisType),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text(
                      thesiscontrollers.detailsData.abstract.toString(),
                      style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DocumentCard(onTap: () {}, title: 'Nice', desc: "Blunde"),
                ],
              ),
              UserSection(
                  userName: 'Risa Rynanda',
                  userDepartement: 'D3 Manajemen Informatika'),
            ],
          ),
        )),
      ),
    );
  }
}
