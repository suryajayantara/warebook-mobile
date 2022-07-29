import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ThesisController extends GetxController {
  TextEditingController title = new TextEditingController();
  TextEditingController createdYear = new TextEditingController();
  TextEditingController abstract = new TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void addThesis() async {
    print(title.text);
  }
}
