import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:warebook_mobile/controllers/InternalResearch/internal_research_controller.dart';
import 'package:warebook_mobile/views/components/appbar/form_appbar.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/form/date_select_form.dart';
import 'package:warebook_mobile/views/components/form/organism/simple_form.dart';
import 'package:warebook_mobile/views/components/form/upload_file_field.dart';

class InternalResearchEditView extends StatefulWidget {
  const InternalResearchEditView({Key? key}) : super(key: key);

  @override
  State<InternalResearchEditView> createState() =>
      _InternalResearchEditViewState();
}

class _InternalResearchEditViewState extends State<InternalResearchEditView> {
  @override
  int id = Get.arguments['id'];
  final internalResearchController = Get.put(InternalResearchController());
  final _key = GlobalKey<FormState>();

  // FileName
  String? proposalName;
  String? dokumentName;

// Function untuk ambil file Dokument
  void selectDocument() async {
    FilePickerResult? getFiles = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (getFiles != null) {
      internalResearchController.getDocument = getFiles;
      setState(() {
        dokumentName = getFiles.files.single.name;
      });
    }
  }

  // Fungsi untuk mendapatkan File Proposal
  void selectProposal() async {
    FilePickerResult? getFiles = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (getFiles != null) {
      internalResearchController.getProposal = getFiles;
      setState(() {
        proposalName = getFiles.files.single.name;
      });
    }
  }

  // fungsi untuk menampilkan file picker
  void selectStartDate() async {
    DateTime? pickedTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));

    setState(() {
      String formatedDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(pickedTime!);
      internalResearchController.projectStartedAt.text = formatedDate;
    });
  }

  void selectFinishDate() async {
    DateTime? pickedTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));

    setState(() {
      String formatedDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(pickedTime!);
      internalResearchController.projectFinishAt.text = formatedDate;
    });
  }

  Widget build(BuildContext context) {
    internalResearchController.editData(id);
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
                        "Edit Pengabdian",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Nunito Sans'),
                      ),
                    ),
                    CustomInputForm(
                      controller: internalResearchController.title,
                      label: 'Judul Penelitian Atau Pengabdian',
                      hintText: 'Masukan Judul Disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: internalResearchController.abstract,
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
                      controller: internalResearchController.budgetType,
                      label: 'Sumber Dana',
                      hintText: 'Masukan Sumber Dana disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      icons: Icon(Icons.payments),
                      controller: internalResearchController.budget,
                      label: 'Jumlah Pendanaan',
                      hintText: 'Masukan Jumlah Pendanaan disini',
                      inputType: TextInputType.number,
                      inputTextFormater: [
                        // Format hanya angka
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))
                      ],
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    DateSelectForm(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        controller: internalResearchController.projectStartedAt,
                        label: 'Tanggal Pengajuan',
                        hint: DateFormat('dd/mm/yyyy').format(DateTime.now()),
                        onTap: selectStartDate,
                        Icon: Icon(Icons.calendar_today_rounded)),
                    DateSelectForm(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        controller: internalResearchController.projectFinishAt,
                        label: 'Tanggal Penyelesaian',
                        hint: DateFormat('dd/mm/yyyy').format(DateTime.now()),
                        onTap: selectFinishDate,
                        Icon: Icon(Icons.calendar_month_outlined)),
                    CustomInputForm(
                      controller: internalResearchController.contractNumber,
                      label: 'No. Kontrak',
                      hintText: 'Masukan No. Kontrak disini',
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
                      controller: internalResearchController.teamMember,
                      label: 'Anggota Pengusul',
                      hintText: 'Masukan Nama Anggota Pengusul disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    UploadField(
                        description: (dokumentName != null)
                            ? dokumentName
                            : "Dokument Pengabdian",
                        padding: EdgeInsets.symmetric(vertical: 10),
                        hasFile: true,
                        ontap: () {
                          selectDocument();
                        }),
                    UploadField(
                        hasFile: true,
                        description: (proposalName != null)
                            ? proposalName
                            : "Proposal Penelitian",
                        padding: EdgeInsets.symmetric(vertical: 10),
                        ontap: () {
                          selectProposal();
                        }),
                    SizedBox(
                      height: 50,
                    )
                  ],
                )),
          )
        ],
        action: () {
          // thesisController.addData();
          internalResearchController.updateInternalResearch(id);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.blue,
            content: Text(
                'Data Terupdate : ${internalResearchController.detailsData.title}'),
          ));
        },
      ),
    );
  }
}
