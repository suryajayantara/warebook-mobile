import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/themes/colors.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15),
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Tugas Akhir",
                  style: TextStyle(color: ColorsTheme.white, fontSize: 10),
                )),
              ),

              Container(
                height: 67,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Text(
                          "Pembuatan Jaje Bali Berbasis Machine Learning dengan Tensorflow dengan bantuan Crytograph dan juga Teknologi 4.0",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito Sans',
                          ),
                          maxLines: 4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                   
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 1,
                width: 300,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Row(
                children: [
                  CircleAvatar(
                    radius: 13,
                    child: Container(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Surya Jayantara I Putu",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          "D3 Manajemen Informatika",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Nunito Sans',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
