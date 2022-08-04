import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/thesis/thesis.dart';

class ThesisService extends GetConnect {
  final url_path = NetworkUtility();

  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NmU2NjFiYi1kNmJkLTRmZjMtOGUxYS05ZmI3ZjVkZDM4NTUiLCJqdGkiOiIxNmQ4ZDAzNDFjNmM4ZjdlN2Q2ODlmZWFmNWQ1MWY4ZjVmYjkxNmUzMzlkZjIzZjQ1N2RjMmI2MjljMDVhNDBkYjliMDA0NTg3NDhhYzlhOSIsImlhdCI6MTY1OTUwNjExNC45MzcwNzUsIm5iZiI6MTY1OTUwNjExNC45MzcwODMsImV4cCI6MTY1OTU5MjUxNC44NzM0NzUsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.CdhCNEOYL5QEGsRlvLp7fqG1ac9qDAnzDukBcULyV6om3jKBVFqz8dEH-gp6L4FlqeMoaHrlnROdd_kyZgglUzIUxGlRhT410szS6X0UlAb2rQmahLiU-0wd8TzoDYzJB7RbcKHSXjpfTqPvDexsSgEEpGzfVJXPTIF0xvlPUaTTbNCBca1mlqKziLP5_V8_RP-H7Frej9-SyJNub_9onS8cgdNqH49oOjUD_JX_JMqI8OFHEWsUS57-RGU8dLiA33dWZ4uuPaGWZLdcsqerhvVPQcSZ40Fuw1hV1Nc8jIgOtCQrEK2BZhzaUitTBzlChKCx7Q3sWMe5tR4AUGKLRffBxPVjilVKfUEOfrqQilHJE_tRgG712pu60gNf3VHF7AvgMsqoXHGw1P9C_9vaznlvny0kxAyd1LBLPqtCsf4iCNv2kpb_2J3JUC2Ztsg3QpQd7USNRyu7d0X0Q-BKRSqzpqEqCOjSlofb97EMCSlORdF5TE3fAYpklf28iuoysLMwRkANlKaWMrjfEy8qOWmMJbS9-tEG3K09StF1uLY5u3bBobMjmZ9VqgS5BB69j_DSJKCYVsEM8FpVhafqCFUAhmkpR4hcKQx42_6lNGn39LLw-X-6DyNqeaviul4wYcYMVJBCntdy6sQFSbbPFIGoJU_lo20YpyO6fnDvzfk";

  Future<Thesis> addThesis(
      Thesis thesis, Uint8List fileByte, String fileName) async {    
    var filePart = MultipartFile(fileByte, filename: fileName);
    var form = FormData({
      'thumbnail_img': filePart,
      'title': thesis.title,
      'abstract': thesis.abstract,
      'tags': thesis.tags
    });
    return await post(
            Uri.parse(url_path.serviceUrl() + 'thesis').toString(), form,
            headers: url_path.header(token))
        .then((value) {
      if (value.body != null && value.isOk) {
        // print(value.body);
        return Thesis.fromJson(value.body['data']);
      } else {
        throw "${value.bodyString}";
      }

      
    });
  }
}
