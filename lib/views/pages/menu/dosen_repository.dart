import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/InternalResearch/internal_research_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/helpers/string_formating.dart';
import 'package:warebook_mobile/models/internalResearch/internal_research.dart';
import 'package:warebook_mobile/views/components/popup/pop_up_menu.dart';
import 'package:warebook_mobile/views/dashboard.dart';
import 'package:warebook_mobile/views/pages/internalResearch/internal_research_view.dart';
import 'package:warebook_mobile/views/pages/thesis/thesis_view.dart';

class DosenRepositoryPage extends StatelessWidget {
  DosenRepositoryPage({Key? key}) : super(key: key);

  final internalResearchController = Get.put(InternalResearchController());
  final stringFormating = new StringFormating();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Get.to(DashboardPage());
                },
                icon: Icon(Icons.arrow_back_ios_rounded)),
            titleSpacing: 0,
            title: Text(
              'Repositori ku',
              style: TextStyle(
                  fontFamily: 'Nunito Sans', fontWeight: FontWeight.w700),
            ),
            bottom: TabBar(
                indicator:
                    TriangleTabIndicator(color: Colors.white, radius: 0.0),
                splashFactory: NoSplash.splashFactory,
                tabs: [
                  Tab(
                    child: Text('Jurnal'),
                  ),
                  Tab(
                    child: Text('Pengabdian'),
                  )
                ]),
          ),
          body: TabBarView(children: [
            ListView.builder(
                itemCount: 1000,
                itemBuilder: (ctx, i) {
                  return Text('Hello World');
                }),
            Obx(() {
              return ListView.builder(
                  itemCount: internalResearchController.listData.length,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      onTap: () {
                        Duration(milliseconds: 500);
                        Get.to(() => InternalResearchDetailsPage(), arguments: {
                          "id": int.parse(internalResearchController
                              .listData[i].id
                              .toString())
                        });
                      },
                      leading: FlutterLogo(size: 72.0),
                      title: Text(stringFormating.truncateWithEllipsis(
                          20,
                          internalResearchController.listData[i].title
                              .toString())),
                      subtitle: Text(stringFormating.truncateWithEllipsis(
                          60,
                          internalResearchController.listData[i].abstract
                              .toString())),
                      trailing: PopUpMenuComponent(menuList: [
                        PopupMenuItem(
                            child: ListTile(
                          title: Text("Update Data"),
                        )),
                        PopupMenuItem(
                            child: ListTile(
                          title: Text("Delete"),
                        ))
                      ], icons: Icon(Icons.more_vert)),
                      isThreeLine: true,
                    );
                  });
            }),
          ]),
        ));
  }
}

class TriangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  TriangleTabIndicator({required Color color, required double radius})
      : _painter = DrawTriangle(color);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class DrawTriangle extends BoxPainter {
  late Paint _paint;

  DrawTriangle(Color color) {
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset triangleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - 10);
    var path = Path();

    path.moveTo(triangleOffset.dx, triangleOffset.dy);
    path.lineTo(triangleOffset.dx + 10, triangleOffset.dy + 10);
    path.lineTo(triangleOffset.dx - 10, triangleOffset.dy + 10);

    path.close();
    canvas.drawPath(path, _paint);
  }
}
