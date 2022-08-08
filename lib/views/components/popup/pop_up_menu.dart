import 'package:flutter/material.dart';

class PopUpMenuComponent extends StatelessWidget {
  Icon icons;
  final List<PopupMenuEntry> menuList;
  PopUpMenuComponent({Key? key, required this.menuList, required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) => menuList),
      icon: icons,
    );
  }
}
