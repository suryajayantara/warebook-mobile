import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/StudentCreativityProgram/student_creativity_program_controller.dart';
import 'package:warebook_mobile/views/components/appbar/form_appbar.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/form/organism/simple_form.dart';
import 'package:warebook_mobile/views/components/form/upload_file_field.dart';

class StudentCreativityProgramCreateView extends StatefulWidget {
  StudentCreativityProgramCreateView({Key? key}) : super(key: key);

  @override
  State<StudentCreativityProgramCreateView> createState() =>
      _StudentCreativityProgramCreateViewState();
}

class _StudentCreativityProgramCreateViewState
    extends State<StudentCreativityProgramCreateView> {
  // Data
  String? documentName;
  
  final studentCreativityProgramController =
      Get.put(StudentCreativityProgramController());
  final _key = GlobalKey<FormState>();

  void selectDocument() async {
    FilePickerResult? getFiles = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (getFiles != null) {
      studentCreativityProgramController.getDocument = getFiles;
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
                        "Repository PKM Baru",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Nunito Sans'),
                      ),
                    ),
                    CustomInputForm(
                      controller: studentCreativityProgramController.creativityType,
                      label: 'Tipe PKM',
                      hintText: 'Masukan Jenis PKM Disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: studentCreativityProgramController.aliases,
                      label: 'Nama Singkatan PKM',
                      hintText: 'Masukan Nama Singkatan PKM Disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: studentCreativityProgramController.title,
                      label: 'Judul',
                      hintText: 'Masukan Judul PKM Disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: studentCreativityProgramController.abstract,
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
                      controller: studentCreativityProgramController.year,
                      label: 'Tahun Terbit',
                      hintText: 'Masukan Tahun Terbit disini',
                      inputType: TextInputType.number,
                      maxLenght: 4,
                      inputTextFormater: [
                        // Format hanya angka
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))
                      ],
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: studentCreativityProgramController.supervisor,
                      label: 'Dosen Pembimbing',
                      hintText: 'Masukan Nama Dosen Pembimbing Disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    UploadField(
                        description: (documentName != null)
                            ? documentName
                            : "Pilih Dokument PKM",
                        padding: EdgeInsets.symmetric(vertical: 10),
                        ontap: () {
                          selectDocument();
                        }),
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
          studentCreativityProgramController.createStudentCreativityProgram();
        },
      ),
    );
  }
}
