
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/views/pages/thesis/create_repo_thesis.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

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
