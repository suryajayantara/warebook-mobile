import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/helpers/string_formating.dart';
import 'package:warebook_mobile/views/dashboard.dart';

class MyRepositoryPage extends StatelessWidget {
  MyRepositoryPage({Key? key}) : super(key: key);

  final thesisController = Get.put(ThesisController());
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
                    child: Text('Tugas Akhir / Skripsi'),
                  ),
                  Tab(
                    child: Text('PKM'),
                  )
                ]),
          ),
          body: TabBarView(children: [
            Obx(() {
              return ListView.builder(
                  itemCount: thesisController.listData.length,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      leading: FlutterLogo(size: 72.0),
                      title: Text(stringFormating.truncateWithEllipsis(
                          20, thesisController.listData[i].title.toString())),
                      subtitle: Text(stringFormating.truncateWithEllipsis(60,
                          thesisController.listData[i].abstract.toString())),
                      trailing: Icon(Icons.more_vert),
                      isThreeLine: true,
                    );
                  });
            }),
            ListView.builder(
                itemCount: 1000,
                itemBuilder: (ctx, i) {
                  return Text('Hello World');
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
