import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/Auth/register_controller.dart';
import 'package:warebook_mobile/views/components/appbar/form_appbar.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/form/dropdown_button.dart';
import 'package:warebook_mobile/views/components/form/organism/simple_form.dart';

class RegisterPage extends StatefulWidget {
  String? type;
  RegisterPage({Key? key, required this.type}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();
  final _registerController = Get.put(RegisterController());

  var idStudy;

  var selectedDepartement;
  var selectedStudy;
  

  @override
  Widget build(BuildContext context) {
    _registerController.getAllDepartemen();
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
                        "Register User",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Nunito Sans'),
                      ),
                    ),
                    CustomInputForm(
                      controller: _registerController.name,
                      label: 'Nama',
                      hintText: 'Masukan Nama Anda',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: _registerController.email,
                      label: 'Email',
                      hintText: 'Masukan Email disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: _registerController.password,
                      label: 'Password',
                      hintText: 'Masukan Password disini',
                      isPassword: false,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: _registerController.uniqueId,
                      label: 'Nomor Identitas',
                      hintText: 'Masukan Nomor Identitas disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    Obx(
                      () {
                        return Container(
                          width: Get.width,
                          child: DropdownButton(
                            hint: Text('Pilih Jurusanmu'),
                            value: selectedDepartement,
                            isExpanded: true,
                            items: _registerController.listDataDepartement
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.departemenName.toString()),
                                      value: e.id,
                                    ))
                                .toList(),
                            onChanged: (e) {
                              setState(() {
                                selectedDepartement = e;
                                _registerController.getStudyById(e);
                              });
                            },
                          ),
                        );
                      },
                    ),
                    Obx(
                      () {
                        return Container(
                          width: Get.width,
                          child: DropdownButton(
                            value: selectedStudy,
                            isExpanded: true,
                            hint: Text('Pilih Prodimu'),
                            items: _registerController.listDataStudy
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.studyName.toString()),
                                      value: e.id,
                                    ))
                                .toList(),
                            onChanged: (e) {
                              setState(() {
                                selectedStudy = e;
                                idStudy = e;
                              });
                            },
                          ),
                        );
                      },
                    )
                  ],
                )),
          )
        ],
        action: () {
          _registerController.registerUser(idStudy, widget.type);
        },
      ),
    );
  }
}

