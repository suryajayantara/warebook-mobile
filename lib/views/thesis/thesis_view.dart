import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/views/components/Card.dart';

class ThesisView extends StatelessWidget {
  const ThesisView({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Container(
            child: Stack(children: [
              Container(
                // Content dari Details dimulai disini
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/window-bg.png',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              // Floating Card untuk judul
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TitleCard(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Abstrak",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Text(
                                      "Dharma Photo Studio merupakan studio foto yang beralamat di Jalan Sidakarya no. 82C, Denpasar, Bali. Karena seluruh proses pemesanan masih dilakukan secara manual, jumlah pesanan yang dapat dilayani saat kondisi sedang ramai Dharma Photo Studio merupakan studio foto yang beralamat di Jalan Sidakarya no. 82C, Denpasar, Bali. Karena seluruh proses pemesanan masih dilakukan secara manual, jumlah pesanan yang dapat dilayani saat kondisi sedang ramai Dharma Photo Studio merupakan studio foto yang beralamat di Jalan Sidakarya no. 82C, Denpasar, Bali. Karena seluruh proses pemesanan masih dilakukan secara manual, jumlah pesanan yang dapat dilayani saat kondisi sedang ramai"),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              children: [
                                DocumentCard(
                                  onTap: () {
                                    print('error');
                                  },
                                ),
                                DocumentCard(
                                  onTap: () {},
                                )
                              ],
                            ),
                          )
                        ]),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 35),
                width: Get.width,
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      print('okay, this back');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.arrow_back),
                        )),
                  )
                ]),
              )
            ]),
          )
        ],
      ),
    ));
  }
}
