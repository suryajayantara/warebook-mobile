import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 70, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SvgPicture.asset(
                //   'assets/images/white-icon.svg',
                //   color: Colors.blue,
                // ),
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Isi Datamu",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          "Daftar untuk mengakses konten",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Column(children: [
                    TextFormField(
                      showCursor: true,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Username",
                        labelText: "Username",
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                    )
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
