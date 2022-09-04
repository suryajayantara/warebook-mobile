import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/Journal/journal_topic_controller.dart';
import 'package:warebook_mobile/views/components/appbar/form_appbar.dart';
import 'package:warebook_mobile/views/components/form/custom_input_form.dart';
import 'package:warebook_mobile/views/components/form/organism/simple_form.dart';

class EditJournalTopic extends StatelessWidget {
  final journalTopicController = Get.find<JournalTopicController>();
  final _key = GlobalKey<FormState>();

  EditJournalTopic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int id = Get.arguments['id'];
    journalTopicController.editData(id);
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
                        "Edit Topik Jurnal",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Nunito Sans'),
                      ),
                    ),
                    CustomInputForm(
                      controller: journalTopicController.title,
                      label: 'Judul Topik',
                      hintText: 'Masukan Judul Topik Disini',
                      padding: EdgeInsets.symmetric(vertical: 10),
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: journalTopicController.description,
                      label: 'Deskripsi',
                      hintText: 'Tuliskan Deskripsi disini',
                      maxLines: 6,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      inputType: TextInputType.multiline,
                      validator: (value) {
                        if (value!.isEmpty) return ("Tidak Boleh Kosong");
                      },
                    ),
                    CustomInputForm(
                      controller: journalTopicController.subject,
                      label: 'Subjek',
                      hintText: 'Masukan Subjek disini',
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
          journalTopicController.updateData(id);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.blue,
            content: Text(
                'Repository Terupdate :  ${journalTopicController.detailsData.title} '),
          ));
        },
      ),
    );
  }
}
