import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';

class DocumentCard extends StatelessWidget {
  final Function()? onTap;
  String? title;
  String? desc;
  bool isEdit;
  final Function()? onDelete;
  final Function()? onUpdate;

  DocumentCard(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.desc,
      this.isEdit = false,
      this.onDelete,
      this.onUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 3,
                spreadRadius: 1,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SvgPicture.asset(ImagePath.file),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          fontFamily: 'Nunito Sans',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        desc.toString(),
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Nunito Sans',
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
              if (isEdit)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.amber,
                      ),
                      onPressed: onUpdate,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: onDelete,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
