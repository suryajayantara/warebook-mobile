import 'package:flutter/material.dart';
import 'package:warebook_mobile/themes/colors.dart';

class UserSection extends StatelessWidget {
  String? userName;
  String? userDepartement;

  UserSection({Key? key, required this.userName, required this.userDepartement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(children: [
        CircleAvatar(
          backgroundColor: ColorsTheme.lightBlue,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Nunito Sans')),
              Text(
                userDepartement.toString(),
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        )
      ]),
    );
  }
}
