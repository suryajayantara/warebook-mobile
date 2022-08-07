import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/journals/journal_document.dart';
import 'package:warebook_mobile/models/journals/journal_topic.dart';
import 'package:warebook_mobile/models/thesis/thesis_document.dart';

class ThesisDocumentService extends GetConnect {
  final url_path = NetworkUtility();
  String routeName = "thesisDocument";
  GetStorage dataStorage = GetStorage('auth');

  Future<List<ThesisDocument>> getAll() async {
    return await get(
            Uri.parse(url_path.serviceUrl() + routeName).toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<ThesisDocument>.from(
            value.body["data"].map((e) => ThesisDocument.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  Future<ThesisDocument> createThesisDocument(ThesisDocument thesisDocument,
      Uint8List fileByte, String fileName, int thesisId) async {
    var filePart = MultipartFile(fileByte, filename: fileName);
    var form = FormData({
      'document_url': filePart,
      'thesis_id': thesisId,
      'document_name': thesisDocument.documentName,
    });
    return await post(
            Uri.parse(url_path.serviceUrl() + routeName).toString(), form,
            headers: url_path.header(dataStorage.read('key')))
        .then((value) {
      if (value.body != null && value.isOk) {
        // print(value.body);
        return ThesisDocument.fromJson(value.body['data']);
      } else {
        throw "${value.bodyString}";
      }

    });
  }

}
