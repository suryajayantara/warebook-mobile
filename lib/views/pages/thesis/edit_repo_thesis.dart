import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/views/components/appbar/form_appbar.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/form/organism/simple_form.dart';

class ThesisEditView extends StatelessWidget {
  ThesisEditView({Key? key}) : super(key: key);
  final thesisController = Get.put(ThesisController());
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int id = Get.arguments['id'];
    thesisController.editData(id);

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
                        "Edit Thesis",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Nunito Sans'),
                      ),
                    ),
                    CustomInputForm(
                      controller: thesisController.title,
                      label: 'Judul',
                      hintText: 'Masukan Judul Disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: thesisController.abstract,
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
                      controller: thesisController.tags,
                      label: 'Kata Kunci',
                      hintText: 'Masukan kata kunci disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      label: "Tahun Pembuatan",
                      controller: thesisController.createdYear,
                      hintText: 'Masukan Tahun Pembuatan',
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
                  ],
                )),
          )
        ],
        action: () {
          thesisController.updateData(id);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.blue,
            content: Text(
                'Repository Terupdate :  ${thesisController.detailsData.title} '),
          ));
        },
      ),
    );
  }
}
