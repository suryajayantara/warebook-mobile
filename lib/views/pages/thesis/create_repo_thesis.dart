import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/form/normal_field.dart';
import 'package:warebook_mobile/views/components/form/number_field.dart';
import 'package:warebook_mobile/views/components/form/text_area_field.dart';

class CreatingThesisRepoView extends StatelessWidget {
  CreatingThesisRepoView({Key? key}) : super(key: key);

  // Controller Init
  final thesisController = Get.put(ThesisController());
  final _key = GlobalKey<FormState>();

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
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 0),
                                child: NormalField(
                                  label: "Judul",
                                  hintText: 'Masukan Judul disini',
                                  controller: thesisController.title,
                                  validate: (value) {
                                    if (value == null) {
                                      return 'Tahun Pembuatan Kosong';
                                    }
                                    return "";
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: NumberField(
                                  label: "Tahun Pembuatan",
                                  hintText: 'Masukan Tanun Pembuatan disini',
                                  controller: thesisController.createdYear,
                                  validate: (value) {
                                    if (value == null) {
                                      return 'Tahun Pembuatan Kosong';
                                    }
                                    return "";
                                  },
                                ),
                              ),
                              TextAreaField(
                                hintText: "Masukan Abstrakmu disini",
                                label: "Abstrak",
                                maxLines: 6,
                                controller: thesisController.abstract,
                                validate: (value) {
                                  if (value == null) {
                                    return 'Tahun Pembuatan Kosong';
                                  }
                                  return "";
                                },
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {}
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
