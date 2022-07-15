import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/views/components/Button.dart';
import 'package:warebook_mobile/views/components/pill.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 150, left: 50, right: 50),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5),
          ]),
      child: Column(
        children: [
          Pill(
            text: "Tugas Akhir",
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Text(
              "Pembuatan Jaje Bali Berbasis Machine Learning dengan Tensorflow ",
              style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 17,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
          ),
          OutlinePillButton(
              onTap: () {
                print("C'on Surje");
              },
              child: SizedBox(
                width: 160,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: Colors.amber,
                      ),
                      Text(
                        'Tambahkan Favorite',
                        style: TextStyle(color: Colors.amber, fontSize: 12),
                      )
                    ]),
              ),
              colors: Colors.amber)
        ],
      ),
    );
  }
}

class DocumentCard extends StatelessWidget {
  final Function()? onTap;

  DocumentCard({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 1,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SvgPicture.asset(ImagePath.file),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BAB I",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            fontFamily: 'Nunito Sans'),
                      ),
                      Text(
                        "Hello World, this is description,Hello World",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Nunito Sans',
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
