import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warebook_mobile/helpers/ext_form_validator.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/helpers/regex_seting.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/form/upload_file_field.dart';
import 'package:warebook_mobile/views/pages/thesis/thesis_view.dart';

class CreatingThesisRepoView extends StatefulWidget {
  CreatingThesisRepoView({Key? key}) : super(key: key);

  @override
  State<CreatingThesisRepoView> createState() => _CreatingThesisRepoViewState();
}

class _CreatingThesisRepoViewState extends State<CreatingThesisRepoView> {
  // Controller Init
  final thesisController = Get.put(ThesisController());
  final _key = GlobalKey<FormState>();
  final _regexExp = new RegexTypeExp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lengkapi Data Repositorymu !',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w800,
                                color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Form(
                          key: _key,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              // Judul
                              CustomInputForm(
                                controller: thesisController.title,
                                hintText: 'Masukan Judul Disini',
                                padding: EdgeInsets.symmetric(vertical: 10),
                                validator: (val) {
                                  // Validasi jika form ini tidak boleh kosong
                                  if (!val!.isNotNull || val.isEmpty)
                                    return "Judul Tidak Boleh Kosong";

                                  // Validasi Jika Form Mimiliki panjang minimal karakter
                                  if (val.length < 1)
                                    return "Judul Harus lebih dari 2 Huruf";
                                },
                              ),

                              // Abstract

                              CustomInputForm(
                                controller: thesisController.abstract,
                                hintText: 'Masukan Abstrak Disini',
                                inputType: TextInputType.multiline,
                                maxLines: 7,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                validator: (val) {
                                  if (!val!.isNotNull || val.isEmpty)
                                    return "Judul Tidak Boleh Kosong";

                                  if (val.length < 2)
                                    return "Judul Harus lebih dari 2 Huruf";
                                },
                              ),

                              CustomInputForm(
                                hintText: 'Masukan Kata Kunci Disini',
                                controller: thesisController.tags,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                validator: (val) {
                                  if (!val!.isNotNull || val.isEmpty)
                                    return "Judul Tidak Boleh Kosong";

                                  if (val.length < 2)
                                    return "Judul Harus lebih dari 2 Huruf";
                                },
                              ),

                              UploadField(
                                  description: thesisController.uploadStatus,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  ontap: () {
                                    thesisController.selectFile();
                                  }),
                              
                              ElevatedButton(
                                  onPressed: () {
                                    // if (_key.currentState!.validate()) {
                                    //   Get.to(ThesisView());
                                    // }

                                  
                                  },
                                  child: Text('Submit'))
                            ],
                          )),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
