import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/views/components/card/pill.dart';

class TitleCard extends StatelessWidget {
  String? title;
  String? type;

  TitleCard({Key? key, required this.title, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 150, left: 35, right: 35),
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
            text: type.toString(),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Text(
              title.toString(),
              style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 17,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
          ),
          // OutlinePillButton(
          //     onTap: () {
          //       print("C'on Surje");
          //     },
          //     child: SizedBox(
          //       width: 160,
          //       child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             Icon(
          //               Icons.bookmark,
          //               color: Colors.amber,
          //             ),
          //             Text(
          //               'Tambahkan Favorite',
          //               style: TextStyle(color: Colors.amber, fontSize: 12),
          //             )
          //           ]),
          //     ),
          //     colors: Colors.amber)
        ],
      ),
    );
  }
}
