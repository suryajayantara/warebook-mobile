import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRepository extends StatelessWidget {
  const CreateRepository({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 80, horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pilih Tipe Repositorimu",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue),
                  ),
                  Text(
                    "Pilih tipe repositori penelitianmu untuk di publish",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: CardCreate(),
            ),
          ],
        ),
      ),
    );
  }
}

class CardCreate extends StatelessWidget {
  const CardCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: 300,
          height: 150,
          child: Row(
            children: [Container(), Container()],
          ),
        ),
      ),
    );
  }
}
