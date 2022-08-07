import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/themes/colors.dart';

import 'Card/organism/document_card.dart';

class DetailScroll extends StatelessWidget {
  const DetailScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(top: height * 0.4),
      padding: EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: ColorsTheme.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            width: 70,
            decoration: BoxDecoration(
                color: ColorsTheme.lightBlue,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(child: Text("PKM")),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
              "Pembuatan Jaje Bali Berbasis Machine Learning dengan Tensorflow dengan bantuan Crytograph dan juga Teknologi 4.0",
              style: TextStyle(fontSize: 24, color: Colors.black)),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: ColorsTheme.grey,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("nama saya",
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Text("Nama Jurusan",
                        style: TextStyle(fontSize: 14, color: Colors.black))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Dharma Photo Studio merupakan studio foto yang beralamat di Jalan Sidakarya no. 82C, Denpasar, Bali. Karena seluruh proses pemesanan masih dilakukan secara manual, jumlah pesanan yang dapat dilayani saat kondisi sedang ramai.. Selanjutnya",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Kata Kunci :",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Column(
              children: [
                DocumentCard(onTap: () {}),
                DocumentCard(onTap: () {}),
                DocumentCard(onTap: () {}),
                DocumentCard(onTap: () {}),
                DocumentCard(onTap: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
