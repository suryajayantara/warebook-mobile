import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/network_utility.dart';

class PDFView extends StatelessWidget {
  // String url = Get.arguments["url"];
  final urlPath = NetworkUtility();
  String url;

  PDFView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //       leading: IconButton(
    //     icon: Icon(Icons.arrow_back_ios_new),
    //     onPressed: () {
    //       Get.back(canPop: true);
    //     },
    //   )),
    //   body: Container(
    //       child: PDF(
    //     onError: (error) {
    //       print(error.toString());
    //     },
    //     onPageError: (page, error) {
    //       print('$page: ${error.toString()}');
    //     },
    //   ).fromUrl(
    //     urlPath.serviceDownload() + url,
    //     headers: {
    //       "Connection": "Keep-Alive",
    //       "Keep-Alive": "timeout=5, max=1000"
    //     },
    //     // maxAgeCacheObject: Duration(days: 7),
    //     errorWidget: (dynamic error) => Center(child: Text(error.toString())),

    //     //duration of cache
    //   )),
    // );

    url = urlPath.serviceDownload() + url;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cached PDF From Url'),
      ),
      body: const PDF().fromUrl(
        url,
        headers: {
          "Connection": "Keep-Alive",
          "Keep-Alive": "timeout=10, max=1000"
        },
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
