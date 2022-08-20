import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/Journal/journal_document_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/alert/custom_alert.dart';
import 'package:warebook_mobile/views/components/appbar/form_appbar.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/form/organism/simple_form.dart';
import 'package:warebook_mobile/views/components/form/upload_file_field.dart';

class JournalCreateView extends StatelessWidget {
  final journalTopicController = Get.put(JournalDocumentController());
  final _key = GlobalKey<FormState>();

  JournalCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: FormAppBar(),
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: SimpleForm(
          widgetList: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                  key: _key,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Journal Baru",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Nunito Sans'),
                        ),
                      ),
                      CustomInputForm(
                        controller: journalTopicController.title,
                        label: 'Judul Journal',
                        hintText: 'Masukan Judul Disini',
                        padding: EdgeInsets.symmetric(vertical: 10),
                        validator: (value) {
                          if (value!.isEmpty) return ("Tidak Boleh Kosong");
                        },
                      ),
                      CustomInputForm(
                        controller: journalTopicController.author,
                        label: 'Pengarang',
                        hintText: 'Masukan Nama Pengarang Disini',
                        padding: EdgeInsets.symmetric(vertical: 10),
                        validator: (value) {
                          if (value!.isEmpty) return ("Tidak Boleh Kosong");
                        },
                      ),
                      CustomInputForm(
                        controller: journalTopicController.abstract,
                        label: 'Abstrak',
                        hintText: 'Tuliskan Abstrak disini',
                        maxLines: 6,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        inputType: TextInputType.multiline,
                        validator: (value) {
                          if (value!.isEmpty) return ("Tidak Boleh Kosong");
                        },
                      ),
                      CustomInputForm(
                        controller: journalTopicController.year,
                        label: 'Tahun Terbit',
                        hintText: 'Masukan Tahun Terbit disini',
                        inputType: TextInputType.number,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        validator: (value) {
                          if (value!.isEmpty) return ("Tidak Boleh Kosong");
                        },
                      ),
                      CustomInputForm(
                        controller: journalTopicController.tags,
                        label: 'Kata Kunci',
                        hintText: 'Masukan kata kunci disini',
                        padding: EdgeInsets.symmetric(vertical: 10),
                        validator: (value) {
                          if (value!.isEmpty) return ("Tidak Boleh Kosong");
                        },
                      ),
                      CustomInputForm(
                        controller: journalTopicController.doi,
                        label: 'DOI',
                        hintText: 'Masukan DOI disini',
                        padding: EdgeInsets.symmetric(vertical: 10),
                        validator: (value) {
                          if (value!.isEmpty) return ("Tidak Boleh Kosong");
                        },
                      ),
                      
                      // UploadField(
                      //     description: (thesisController.statusData)
                      //         ? thesisController.filename.toString()
                      //         : "Pilih Satu File",
                      //     padding: EdgeInsets.symmetric(vertical: 10),
                      //     ontap: () {
                      //       thesisController.selectFile();
                      //     }),
                    ],
                  )),
            )
          ],
          action: () {
            // thesisController.addData();
          },
        ),
      ),
    );
  }
}
