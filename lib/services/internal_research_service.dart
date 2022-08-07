import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/internalResearch/internal_research.dart';

class internalResearchService extends GetConnect {
  final url_path = NetworkUtility();
  GetStorage dataStorage = GetStorage('auth');

  Future<List<InternalResearch>> getAll() async {
    return await get(Uri.parse(url_path.serviceUrl() + 'research').toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<InternalResearch>.from(
            value.body["data"].map((e) => InternalResearch.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  // Future<Thesis> addThesis(
  //     Thesis thesis, Uint8List fileByte, String fileName) async {
  //   var filePart = MultipartFile(fileByte, filename: fileName);
  //   var form = FormData({
  //     'thumbnail_img': filePart,
  //     'title': thesis.title,
  //     'abstract': thesis.abstract,
  //     'tags': thesis.tags
  //   });
  //   return await post(
  //           Uri.parse(url_path.serviceUrl() + 'thesis').toString(), form,
  //           headers: url_path.header(dataStorage.read('key')))
  //       .then((value) {
  //     if (value.body != null && value.isOk) {
  //       // print(value.body);
  //       return Thesis.fromJson(value.body['data']);
  //     } else {
  //       throw "${value.bodyString}";
  //     }

  //   });
  // }

}
