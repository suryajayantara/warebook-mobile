import 'dart:typed_data';
import 'dart:io';

import 'package:get/get.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/thesis.dart';

class ThesisService extends GetConnect {
  final url_path = NetworkUtility();

  void addThesis(Thesis thesis, Uint8List fileByte, String fileName) async {
    var filePart = MultipartFile(fileByte, filename: fileName);
    var form = FormData({'document': filePart});
    // print(filePart.contentType);
    return await post(
            Uri.parse(url_path.serviceUrl() + 'thesis').toString(), form)
        .then((value) {
      // if (value.body != null && value.isOk) {
      //   print(form.files.);
      // }

      print(value.body);
    });
  }
}
