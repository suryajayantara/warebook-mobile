import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Card/card.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 150),
          child: Column(
            children: [
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardView(),
                    SizedBox(
                      width: 15,
                    ),
                    CardView(),
                    SizedBox(
                      width: 15,
                    ),
                    CardView(),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}


