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

  // Add
  Future<JournalDocument> createJournalDocument(JournalDocument journalDocument,
      Uint8List fileByte, String fileName, String journalTopic) async {
    var filePart = MultipartFile(fileByte, filename: fileName);
    var form = FormData({
      'document_url': filePart,
      'journal_topic': journalTopic,
      'title': journalDocument.title,
      'author': journalDocument.author,
      'abstract': journalDocument.abstract,
      'year': journalDocument.abstract,
      'original_url': journalDocument.originalUrl,
      'tags': journalDocument.tags,
      'doi': journalDocument.doi
    });
    return await post(
            Uri.parse(url_path.serviceUrl() + routeName).toString(), form,
            headers: url_path.header(dataStorage.read('key')))
        .then((value) {
      if (value.body != null && value.isOk) {
        return JournalDocument.fromJson(value.body['data']);
      } else {
        throw "${value.bodyString}";
      }
    });
  }
}
