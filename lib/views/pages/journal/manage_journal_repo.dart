import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/controllers/Journal/journal_document_controller.dart';
import 'package:warebook_mobile/controllers/Journal/journal_topic_controller.dart';
import 'package:warebook_mobile/helpers/string_formating.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/button/outline_button.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';
import 'package:warebook_mobile/views/components/card/organism/document_card.dart';
import 'package:warebook_mobile/views/components/popup/custom_dialog.dart';
import 'package:warebook_mobile/views/pages/journal/create_repo_journal.dart';
import 'package:warebook_mobile/views/pages/journal/edit_journal_document_repo.dart';
import 'package:warebook_mobile/views/pages/utils/pdf_view.dart';

class ManageJournalRepo extends StatelessWidget {
  var urlPath = NetworkUtility();
  int id = Get.arguments["id"];
  // final thesisControllers = Get.put(ThesisController());
  final journalTopicController = Get.find<JournalTopicController>();
  final journalController = Get.put(JournalDocumentController());
  final stringFormating = StringFormating();
  ManageJournalRepo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    journalTopicController.getJournalTopicDetails(id);
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.file_upload_rounded),
        onPressed: () {
          Get.to(JournalCreateView(),
              arguments: {'id': journalTopicController.detailsData.id});
        },
      ),
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
          title: Text(
            stringFormating.truncateWithEllipsis(
                20, journalTopicController.detailsData.title.toString()),
            style: TextStyle(color: ColorsTheme.black),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Obx(() {
            if (!journalController.isLoading.value) {
              if (journalController.listData.length != null &&
                  journalController.listData.length > 0) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: journalController.listData.length,
                  itemBuilder: (ctx, i) {
                    return DocumentCard(
                      isEdit: true,
                      onTap: () {
                        Get.to(() => PDFView(
                              url: journalController.listData[i].documentUrl
                                  .toString(),
                            ));
                      },
                      title: journalController.listData[i].title.toString(),
                      desc: journalController.listData[i].abstract.toString(),
                      onUpdate: () {
                        // print(journalTopicController.detailsData.id);
                        // print(journalController.listData[i].id.toString());
                        // journalController.editThesisDocument(
                        //     journalController.listData[i].id.toString());

                        Get.to(() => JournalDocumentEditRepo(), arguments: {
                          'id': journalController.listData[i].id,
                          'idJournal': journalTopicController.detailsData.id
                        });
                      },
                      onDelete: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomPopUpDialog(
                                title:
                                    'Hapus ${journalController.listData[i].title}',
                                desc:
                                    'Yakin ingin menghapus Jurnal ${journalController.listData[i].title} pada Repository ${journalTopicController.detailsData.title} ? Data akan terhapus selamanya !',
                                button: [
                                  SolidButton(
                                    onTap: () {
                                      // thesisDocumentController
                                      //     .deleteThesisDocument(
                                      //         thesisDocumentController
                                      //             .listData[i].id,
                                      //         id)
                                      //     .then((value) {
                                      //   if (value) {
                                      //     Navigator.pop(context);
                                      //     ScaffoldMessenger.of(context)
                                      //         .showSnackBar(SnackBar(
                                      //       backgroundColor: Colors.blue,
                                      //       content: Text(
                                      //           'Dokument Berhasil Dihapus'),
                                      //     ));
                                      //   } else {
                                      //     Navigator.pop(context);

                                      //     ScaffoldMessenger.of(context)
                                      //         .showSnackBar(SnackBar(
                                      //       backgroundColor: Colors.red,
                                      //       content: Text(value.toString()),
                                      //     ));
                                      //   }
                                      // });
                                    },
                                    title: 'Hapus',
                                    width: 120,
                                    color: Colors.red,
                                  ),
                                  OutlineButton(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    title: 'Batalkan',
                                    width: 120,
                                    color: Colors.red,
                                    textColor: Colors.red,
                                  )
                                ],
                              );
                            });
                      },
                    );
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
      ),
    ));
  }
}
