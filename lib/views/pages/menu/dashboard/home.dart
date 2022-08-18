import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 35),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Pagi',
                    style: TextStyle(fontFamily: 'Nunito Sans', fontSize: 18),
                  ),
                  Text(
                    'Surya Jayantara',
                    style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 25,
              )
            ],
          ),
        ],
      ),
    ));
  }
}
