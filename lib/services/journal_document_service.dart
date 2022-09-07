import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/journals/journal_document.dart';
import 'package:warebook_mobile/models/journals/journal_topic.dart';

class JournalDocumentService extends GetConnect {
  final url_path = NetworkUtility();
  String routeName = 'journalDocument';
  GetStorage dataStorage = GetStorage('auth');

  Future<List<JournalDocument>> getAll() async {
    return await get(Uri.parse(url_path.serviceUrl() + routeName).toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<JournalDocument>.from(
            value.body["data"].map((e) => JournalDocument.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  Future<List<JournalDocument>> getAllByTopics(id) async {
    print(Uri.parse(
            url_path.serviceUrl() + routeName + '/single/' + id.toString())
        .toString());
    return await get(Uri.parse(
                url_path.serviceUrl() + routeName + '/single/' + id.toString())
            .toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<JournalDocument>.from(
            value.body["data"].map((e) => JournalDocument.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  // Add
  Future<JournalDocument> createJournalDocument(FormData form) async {
    return await post(
            Uri.parse(url_path.serviceUrl() + routeName).toString(), form,
            headers: url_path.header(dataStorage.read('token')))
        .then((value) {
      if (value.body != null && value.isOk) {
        return JournalDocument.fromJson(value.body['data']);
      } else {
        throw "${value.bodyString}";
      }
    });
  }

  Future<JournalDocument> updateJournalDocument(FormData form, int id) async {
    return await post(
            Uri.parse(url_path.serviceUrl() + "${routeName}/$id").toString(),
            form,
            headers: url_path.header(dataStorage.read('token')))
        .then((value) {
      if (value.body != null && value.isOk) {
        return JournalDocument.fromJson(value.body['data']);
      } else {
        throw "${value.bodyString}";
      }
    });
  }

  Future<bool> deleteJournalDocument(id) async {
    String token = dataStorage.read('token');
    return await delete(
            Uri.parse(url_path.serviceUrl() + "${routeName}/$id").toString(),
            headers: url_path.header(token.toString()))
        .then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        return true;
      } else {
        print(value.body);
        return false;
      }
    }).catchError((e) {
      throw e;
    });
  }
}
