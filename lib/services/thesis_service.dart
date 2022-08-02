import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/thesis.dart';

class ThesisService extends GetConnect {
  final url_path = NetworkUtility();

  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NmU2NjFiYi1kNmJkLTRmZjMtOGUxYS05ZmI3ZjVkZDM4NTUiLCJqdGkiOiIwYWJhOTMxN2Q4ZGRiMTY1OGYzNzBkMzJmYWM4MmRmYjdlOTI2MTdkOTVjYmM0Mjc2MjQ3Zjk4YjU1OWFmNTIyNWEzYWNlZDg1YjdlYjdiOSIsImlhdCI6MTY1OTQyOTc4Mi42NDE2MzYsIm5iZiI6MTY1OTQyOTc4Mi42NDE2NDMsImV4cCI6MTY1OTUxNjE4Mi42MzUzMDMsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.UBHwacz1mNHVEUFBe7jySeHBE59JIXw7F2SIXS6i8GFH1BK0qknuAA3Rc7KpL3aEiS-RrwqQbVQqLOZWU1HAqFd2SUPNlaNXY6h9WGvVaXmrv6hC1v26oxtPBMIg8pKc0ISTfLv2rfcUnSNmFAIRRH4sbGRuQetfYxNCD0nBdZFxPL_iqPHecbYvLBsztfsOpT8f7Rm5IF5JBuKcqONjjYUk_9KvnTpm9G9EThzplIYy6noB2ZmBINMzy-_HoFbtpPwvTAbVxp2k9BQfvG8h4-UFyf84CYUcuTcn1QCzHm2Aih6876ne7VVS_cJh3EhfiiWifHqlpkNjMzU6PiA6ovsPwJEV87TfE16G4v4-P0A7glnuyaemyCNvzoRuLaqn884RgQKwdHwpiw_WGmTpRtMlM00CpwkBE7ETawFJ_sCcS4GjFnzeP4M_-KcC2Rin1cM1Ei_lkmyoTOteiRLgGczja_GGZduBwvsqAyN-FzuksMpT4W8GP0oVG6NAMvYon8oJ9N2xL43z5-D2abqpMWhD1ZzeNrmpFtUS9MTDI4TnsUIVBAmJW11BJWSCQ4HXYCRpTqSeCdZzKutTbWfd2AOGIGBq3RKf_MwaMENLxZxDw6AqBErI-dO4D7GINQFkrqNuo1CtJnLK3MufzF7aKkf3Q00o8NunDlyV17GAVWg";

  void addThesis(Thesis thesis, Uint8List fileByte, String fileName) async {    
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


      // if (value.body != null && value.isOk) {
      //   print(form.files.);x
      // }

      print(value.body);
    });
  }
}
