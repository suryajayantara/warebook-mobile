import 'package:flutter/material.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              print("object");
            },
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    )
                  ]),
            ),
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           width: 150,
          //           height: 150,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.only(
          //                   topLeft: Radius.circular(5),
          //                   topRight: Radius.circular(5)),
          //               image: DecorationImage(
          //                   image: AssetImage('assets/images/splash-bg.png'),
          //                   fit: BoxFit.cover)),
          //         ),
          //         Container(
          //           margin: EdgeInsets.all(5),
          //           child: Text("title"),
          //         ),
          //         Container(
          //             margin: EdgeInsets.only(left: 5, right: 5),
          //             width: 150,
          //             height: 100,
          //             child: Text(
          //               "Pembuatan Jaje Bali Berbasis Machine Learning dengan Tensorflow dengan bantuan Crytograph dan juga Teknologi 4.0",
          //               maxLines: 5,
          //             )),
          //         Container(
          //           width: 150,
          //           child: Row(
          //             children: [
          //               Container(
          //                 height: 20,
          //                 width: 20,
          //                 color: Colors.black,
          //               ),
          //               Column(
          //                 children: [
          //                   Container(
          //                     margin: EdgeInsets.only(left: 5, right: 5),
          //                     child: Text("nama saya"),
          //                   ),
          //                   Container(
          //                     margin: EdgeInsets.only(left: 5, right: 5),
          //                     child: Text("nim saya"),
          //                   ),
          //                 ],
          //               ),
          //               Container(
          //                 margin: EdgeInsets.only(left: 40, right: 5),
          //                 child: Text("dsasda"),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
