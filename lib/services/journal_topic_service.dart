import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/journals/journal_document.dart';
import 'package:warebook_mobile/models/journals/journal_topic.dart';

class JournalTopicService extends GetConnect {
  final url_path = NetworkUtility();
  String routeName = 'journalDocument';
  GetStorage dataStorage = GetStorage('auth');


  /* 
    Get All Journal Topics (Auth Needed)
    Method : GET
    URL : api.com/journalTopic
    Desc : Untuk mendapaktan semua data journal topic, berisi selasi topic dan juga user yang memiliki repo 
    Header  : 
                - Accept : application/json
                - Authencticatop : Baerer Token
    Body    : NaN
  */

  Future<List<JournalTopic>> getAll() async {
    return await get(
            Uri.parse(url_path.serviceUrl() + 'journalTopic').toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<JournalTopic>.from(
            value.body["data"].map((e) => JournalTopic.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  
  /* 
    Create Journal Topics (Auth Needed)
    Method  : POST
    URL     : api.com/journalTopic
    Desc    : Digunakan untuk Store / Menyimpan data Journal Topic 
    Header  : 
                - Accept : application/json
                - Authencticatop : Baerer Token
    Body    : 
                - title(String) => Judul dari Journal Topic
                - Description(String) => Deskripsi dari journal topic itu sendiri
                - Subject (String) => Subject dari journal topic itu sendiri
  
  */

  Future<JournalTopic> createJournalTopic(
    JournalTopic journalTopic,
  ) async {
    String token = dataStorage.read('token');

    var form = FormData({
      'title': journalTopic.title,
      'description': journalTopic.description,
      'subject': journalTopic.subject
    });

    return await post(
            Uri.parse(url_path.serviceUrl() + 'journalTopic').toString(), form,
            headers: url_path.header(token.toString()))
        .then((value) {
      if (value.body != null && value.isOk) {
        return JournalTopic.fromJson(value.body['data']);
      } else {
        throw "${value.bodyString} ${value.statusCode}";
      }
    });
  }
}
