import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/network_utility.dart';

class PDFView extends StatelessWidget {
  String url = Get.arguments["url"];
  final urlPath = new NetworkUtility();
  PDFView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Get.back();
        },
      )),
      body: Container(
          child: PDF().cachedFromUrl(
        urlPath.serviceDownload() + url,
        headers: {
          "Connection": "Keep-Alive",
          "Keep-Alive": "timeout=5, max=1000"
        },
        maxAgeCacheObject: Duration(days: 7),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
        
        //duration of cache
      )),
    );
  }
}
