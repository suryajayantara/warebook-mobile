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

  Future<List<ThesisDocument>> getAllByThesis(id) async {
    return await get(
            Uri.parse(url_path.serviceUrl() + routeName + '/${id}').toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<ThesisDocument>.from(
            value.body["data"].map((e) => ThesisDocument.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  Future<ThesisDocument> createThesisDocument(FormData formData) async {
    try {
      return await post(
      Uri.parse(url_path.serviceUrl() + routeName).toString(),
      formData,
              headers: url_path.headerFiles(dataStorage.read('token'))
    )
        .then((value) {
        if (value.body != null && value.isOk) {
        return ThesisDocument();
      } else {
          throw "${value.bodyString} ${value.statusCode}";
      }

    });
    } catch (e) {
      throw e;
    }
  }

  Future<ThesisDocument> updateThesisDocument(
    FormData form,
    int id,
  ) async {
    String token = dataStorage.read('token');
    return await post(
            Uri.parse(url_path.serviceUrl() + '${routeName}/${id}').toString(),
            form,
            headers: url_path.header(token.toString()))
        .then((value) {
      if (value.body != null && value.isOk) {
        print(value.body);
        return ThesisDocument();
      } else {
        print(value.bodyBytes);
        throw "${value.bodyString} ${value}";
      }
    });
  }

  Future<bool> deleteThesisDocument(id) async {
    String token = dataStorage.read('token');
    return await delete(
            Uri.parse(url_path.serviceUrl() + '${routeName}/${id}').toString(),
            headers: url_path.header(token.toString()))
        .then((value) {
      if (value.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }).catchError((e) {
      throw e;
    });
  }

}
