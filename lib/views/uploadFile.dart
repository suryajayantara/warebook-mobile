import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:warebook_mobile/views/components/SolidButton.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Input Your Dokument",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "Masukkan dokumen yang diperlukan pada repositori.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      showCursor: true,
                      autofocus: true,
                      decoration: InputDecoration(
                        label: Text("Nama"),
                        hintText: "Nama Bagian",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                TextFormField(
                                  showCursor: true,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    label: Text("No."),
                                    hintText: "No. Bagian",
                                    border: OutlineInputBorder(),
                                  ),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [Text("S/D")],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                TextFormField(
                                  showCursor: true,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    label: Text("No."),
                                    hintText: "No. Bagian",
                                    border: OutlineInputBorder(),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          padding: EdgeInsets.all(6),
                          dashPattern: [8, 4],
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 35,
                                ),
                                alignment: Alignment.center,
                                child: Text("Pilih File")),
                          )),
                    ),
                  ],
                )),
                SizedBox(
                  height: 50,
                ),
                SolidButton(onTap: () {}, title: "Upload")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
