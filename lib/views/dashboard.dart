
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_document_controller.dart';
import 'package:warebook_mobile/views/pages/thesis/create_repo_thesis.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  // sandbox
  // final _controller = Get.put(StudentCreativityProgramController());
  final _controller_two = Get.put(ThesisDocumentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(ThesisCreateView());
          },
          child: Text("+")),
    );
  }
}
