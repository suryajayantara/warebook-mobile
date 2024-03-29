import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/internalResearch/internal_research.dart';

class InternalResearchService extends GetConnect {
  final urlPath = NetworkUtility();
  final routeName = "research";
  GetStorage dataStorage = GetStorage('auth');

/* 
    Get Internal Research - all (Auth Needed)
    Method  : GET
    URL     : api.com/journalTopic
    Desc    : Digunakan untuk Store / Menyimpan data Journal Topic 
    Header  : 
                - Accept : application/json
                - Authencticatop : Baerer Token
    Body    : 
                - title(String) => Judul dari Journal Topic
                - Abstract(String) => Deskripsi dari journal topic itu sendiri
                
  
  */


  Future<List<InternalResearch>> getAll() async {
    return await get(Uri.parse(urlPath.serviceUrl() + routeName).toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<InternalResearch>.from(
            value.body["data"].map((e) => InternalResearch.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  Future<List<InternalResearch>> getAllByAuth() async {
    return await get(
            Uri.parse(urlPath.serviceUrl() + routeName + '/auth').toString(),
            headers: urlPath.header(dataStorage.read('token')))
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<InternalResearch>.from(
            value.body["data"].map((e) => InternalResearch.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  Future<InternalResearch> getDetails(int id) async {
    return await get(
            Uri.parse(urlPath.serviceUrl() + routeName + '/${id}').toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return InternalResearch.fromJson(value.body['data']);
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  
  /* 
    Create Internal Research (Auth Needed)
    Method  : POST
    URL     : api.com/journalTopic
    Desc    : Digunakan untuk Store / Menyimpan data Journal Topic 
    Header  : 
                - Accept : application/json
                - Authencticatop : Baerer Token
    Body    : 
                - title(String) => Judul dari Journal Topic
                - Abstract(String) => Deskripsi dari journal topic itu sendiri
                
  
  */

  Future<void> createInternalResearch(
      form) async {
    
    await post(
            Uri.parse(urlPath.serviceUrl() + routeName).toString(), form,
            headers: urlPath.header(dataStorage.read('token')))
        .then((value) {
      if (value.body != null && value.isOk) {
        // Problem here
        // return InternalResearch();
        // print(internalResearch.fromJson(value.body['data']));
      } else {
        throw "${value.bodyString} - ${value.statusCode} - ${value.body}";
      }
    }).catchError((e) {
      throw e;
    });
    
  }

  Future<InternalResearch> updateIntenralResearch(
    FormData form,
    int id,
  ) async {
    String token = dataStorage.read('token');
    return await post(
            Uri.parse(urlPath.serviceUrl() + '${routeName}/${id}').toString(),
            form,
            headers: urlPath.header(token.toString()))
        .then((value) {
      if (value.body != null && value.isOk) {
        print(value.body);
        return InternalResearch();
      } else {
        print(value.bodyBytes);
        throw "${value.bodyString} ${value}";
      }
    });
  }


  Future<bool> deleteInternalResearch(id) async {
    String token = dataStorage.read('token');
    return await delete(
            Uri.parse(urlPath.serviceUrl() + '${routeName}/${id}').toString(),
            headers: urlPath.header(token.toString()))
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
