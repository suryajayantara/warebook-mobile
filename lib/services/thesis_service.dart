import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/thesis/thesis.dart';

class ThesisService extends GetConnect {
  final url_path = NetworkUtility();
  GetStorage dataStorage = GetStorage('auth');

  Future<List<Thesis>> getAll() async {
    return await get(Uri.parse(url_path.serviceUrl() + 'thesis').toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<Thesis>.from(
            value.body["data"].map((e) => Thesis.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  // Ntar jangan lupa pindahin form datanya ke controller

  Future<Thesis> addThesis(
    Thesis thesis,
  ) async {
    String token = dataStorage.read('token');

    var form = FormData({
      'title': thesis.title,
      'abstract': thesis.abstract,
      'tags': thesis.tags,
      'thesis_type': 'Tugas Akhir'
    });

    return await post(
            Uri.parse(url_path.serviceUrl() + 'thesis').toString(), form,
            headers: url_path.header(token.toString()))
        .then((value) {
      if (value.body != null && value.isOk) {
        return Thesis.fromJson(value.body['data']);
      } else {
        throw "${value.bodyString} ${value.statusCode}";
      }
    });
  }

  Future<Thesis> updateThesis(
    FormData form,
    int id,
  ) async {
    String token = dataStorage.read('token');

    return await post(
            Uri.parse(url_path.serviceUrl() + 'thesis/${id}').toString(), form,
            headers: url_path.header(token.toString()))
        .then((value) {
      if (value.body != null && value.isOk) {
        // return Thesis.fromJson(value.body['data']);
        print(value.body);
        return Thesis();
      } else {
        throw "${value.bodyString} ${value.statusCode}";
      }
    });
  }

  Future<bool> deleteThesis(id) async {
    String token = dataStorage.read('token');
    return await delete(
            Uri.parse(url_path.serviceUrl() + 'thesis/${id}').toString(),
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
