import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_document_controller.dart';
import 'package:warebook_mobile/views/components/appbar/form_appbar.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/form/organism/simple_form.dart';
import 'package:warebook_mobile/views/components/form/upload_file_field.dart';

class ThesisDocumentCreateView extends StatefulWidget {
  const ThesisDocumentCreateView({Key? key}) : super(key: key);

  @override
  State<ThesisDocumentCreateView> createState() =>
      _ThesisDocumentCreateViewState();
}

class _ThesisDocumentCreateViewState extends State<ThesisDocumentCreateView> {
  int id = Get.arguments['id'];
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
    return Scaffold(
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
                        "Thesis Baru",
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
          thesisDocumentController.createThesisDocument(id);
        },
      ),
    );
  }
}
