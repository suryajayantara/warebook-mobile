import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Card/organism/document_card.dart';
import 'package:warebook_mobile/views/components/detail_scroll.dart';

class DetailRepositoryPage extends StatelessWidget {
  const DetailRepositoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: height * 0.44,
                decoration: BoxDecoration(color: ColorsTheme.lightBlue),
              ),
              DetailScroll(),
            ],
          ),
        ],
      ),
    );
  }
}
