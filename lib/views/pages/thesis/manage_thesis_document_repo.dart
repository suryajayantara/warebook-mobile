import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_document_controller.dart';
import 'package:warebook_mobile/helpers/string_formating.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/button/outline_button.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';
import 'package:warebook_mobile/views/components/card/organism/document_card.dart';
import 'package:warebook_mobile/views/components/popup/custom_dialog.dart';
import 'package:warebook_mobile/views/pages/thesis/create_document_thesis.dart';
import 'package:warebook_mobile/views/pages/thesis/edit_repo_thesis_document.dart';
import 'package:warebook_mobile/views/pages/utils/pdf_view.dart';

class ManageThesisDocumentPage extends StatelessWidget {
  var urlPath = NetworkUtility();
  int id = Get.arguments["id"];
  // final thesisControllers = Get.put(ThesisController());
  final thesiscontrollers = Get.find<ThesisController>();
  final thesisDocumentController = Get.put(ThesisDocumentController());
  ManageThesisDocumentPage({Key? key}) : super(key: key);

  final stringFormating = StringFormating();

  @override
  Widget build(BuildContext context) {
    thesiscontrollers.getThesisDetails(id);
    thesisDocumentController.getByThesisId(id);

    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.file_upload_rounded),
        onPressed: () {
          Get.to(ThesisDocumentCreateView(),
              arguments: {'id': thesiscontrollers.detailsData.id});
        },
      ),
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
          title: Text(
            stringFormating.truncateWithEllipsis(
                20, thesiscontrollers.detailsData.title.toString()),
            style: TextStyle(color: ColorsTheme.black),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Obx(() {
            if (!thesisDocumentController.isLoading.value) {
              if (thesisDocumentController.listData.length != null &&
                  thesisDocumentController.listData.length > 0) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: thesisDocumentController.listData.length,
                  itemBuilder: (ctx, i) {
                    return DocumentCard(
                      isEdit: true,
                      onTap: () {
                        Get.to(() => PDFView(
                              url: thesisDocumentController.listData[i].url
                                  .toString(),
                            ));
                      },
                      title: thesisDocumentController.listData[i].documentName
                          .toString(),
                      desc: thesisDocumentController.listData[i].documentName
                          .toString(),
                      onUpdate: () {
                        Get.to(() => EditThesisDocumentRepositoryPage(),
                            arguments: {
                              "id": thesisDocumentController.listData[i].id,
                              "thesisId": thesiscontrollers.detailsData.id
                            });
                      },
                      onDelete: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomPopUpDialog(
                                title:
                                    'Hapus ${thesisDocumentController.listData[i].documentName}',
                                desc:
                                    'Yakin ingin menghapus Dokument ${thesisDocumentController.listData[i].documentName} pada Repository ${thesiscontrollers.detailsData.title} ? Data akan terhapus selamanya !',
                                button: [
                                  SolidButton(
                                    onTap: () {
                                      thesisDocumentController
                                          .deleteThesisDocument(
                                              thesisDocumentController
                                                  .listData[i].id,
                                              id)
                                          .then((value) {
                                        if (value) {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            backgroundColor: Colors.blue,
                                            content: Text(
                                                'Dokument Berhasil Dihapus'),
                                          ));
                                        } else {
                                          Navigator.pop(context);

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(value.toString()),
                                          ));
                                        }
                                      });
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
