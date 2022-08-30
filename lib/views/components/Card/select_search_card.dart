import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectSearchCard extends StatelessWidget {
  String? urlImage;
  String? title;
  String? desc;
  final Function()? ontap;
  double height;
  EdgeInsets margin;
  SelectSearchCard(
      {Key? key,
      this.desc,
      this.title,
      this.urlImage,
      required this.height,
      required this.margin,
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: margin,
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toString(),
                    style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 150,
                    child: Text(
                      desc.toString(),
                      style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      maxLines: 4,
                    ),
                  )
                ],
              ),
              SvgPicture.asset(
                urlImage.toString(),
                height: height,
              )
            ],
          ),
        ),
      ),
    );
  }
}
