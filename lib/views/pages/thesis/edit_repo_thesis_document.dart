import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_document_controller.dart';
import 'package:warebook_mobile/views/components/appbar/form_appbar.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/form/organism/simple_form.dart';
import 'package:warebook_mobile/views/components/form/upload_file_field.dart';

class EditThesisDocumentRepositoryPage extends StatefulWidget {
  const EditThesisDocumentRepositoryPage({Key? key}) : super(key: key);

  @override
  State<EditThesisDocumentRepositoryPage> createState() =>
      _EditThesisDocumentRepositoryPageState();
}

class _EditThesisDocumentRepositoryPageState
    extends State<EditThesisDocumentRepositoryPage> {
  int id = Get.arguments['id'];
  int idThesis = Get.arguments['thesisId'];
  final thesisDocumentController = Get.put(ThesisDocumentController());
  final _key = GlobalKey<FormState>();
  String? documentName;

  void selectDocument() async {
    FilePickerResult? getFiles = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (getFiles != null) {
      thesisDocumentController.getDocument = getFiles;
      setState(() {
        documentName = getFiles.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    thesisDocumentController.editThesisDocument(id);
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
                          "Edit Dokument Tugas Akhir / Skripsi",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Nunito Sans'),
                        ),
                      ),
                      CustomInputForm(
                        controller: thesisDocumentController.documentName,
                        label: 'Judul',
                        hintText: 'Masukan Nama Dokumen',
                        padding: EdgeInsets.symmetric(vertical: 10),
                        validator: (value) {
                          if (value!.isEmpty) return ("Tidak Boleh Kosong");
                        },
                      ),
                      UploadField(
                          hasFile: (documentName != null) ? true : false,
                          description: (documentName != null)
                              ? documentName
                              : "Pilih Dokument Penelitian",
                          padding: EdgeInsets.symmetric(vertical: 10),
                          ontap: () {
                            selectDocument();
                          }),
                    ],
                  )),
            )
          ],
          action: () {
            // thesisController.addData();
            thesisDocumentController.updateThesisDocument(id, idThesis);
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.blue,
              content: Text(
                  'Dokument Terupdate :  ${thesisDocumentController.detailsData.documentName} '),
            ));
            // print(documentName);
          },
        ),
      ),
    );
  }
}
