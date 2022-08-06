import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/InternalResearch/internal_research_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/appbar/form_appbar.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/form/organism/simple_fom.dart';
import 'package:warebook_mobile/views/components/form/upload_file_field.dart';

class InternalResearchCreateView extends StatelessWidget {
  final internalResearchController = Get.put(InternalResearchController());
  final _key = GlobalKey<FormState>();

  InternalResearchCreateView({Key? key}) : super(key: key);
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
                        "Internal Research Baru",
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
                      controller: internalResearchController.budget,
                      label: 'Jumlah Pendanaan',
                      hintText: 'Masukan Jumlah Pendanaan disini',
                      inputType: TextInputType.number,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),

                    CustomInputForm(
                      controller: internalResearchController.projectStartedAt,
                      label: 'Waktu Projek Dimulai',
                      hintText: 'Masukan Waktu Dimulai disini',
                      inputType: TextInputType.datetime,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: internalResearchController.projectFinishAt,
                      label: 'Waktu Projek Diselesaikan',
                      hintText: 'Masukan Waktu Diselesaikan disini',
                      inputType: TextInputType.datetime,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: internalResearchController.contractNumber,
                      label: 'No. Kontrak',
                      hintText: 'Masukan No. Kontrak disini',
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
                    // UploadField(
                    //     description: (thesisController.statusData)
                    //         ? thesisController.filename.toString()
                    //         : "Pilih Satu File",
                    //     padding: EdgeInsets.symmetric(vertical: 10),
                    //     ontap: () {
                    //       thesisController.selectFile();
                    //     }),
                    SizedBox(
                      height: 50,
                    )
                  ],
                )),
          )
        ],
        action: () {
          // thesisController.addData();
        },
      ),
    );
  }
}
