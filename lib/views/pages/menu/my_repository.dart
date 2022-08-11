import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_document_controller.dart';
import 'package:warebook_mobile/helpers/string_formating.dart';
import 'package:warebook_mobile/views/components/button/outline_button.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';
import 'package:warebook_mobile/views/components/popup/pop_up_menu.dart';
import 'package:warebook_mobile/views/custom_pop_up_dialog.dart';
import 'package:warebook_mobile/views/dashboard.dart';
import 'package:warebook_mobile/views/pages/thesis/edit_repo_thesis.dart';
import 'package:warebook_mobile/views/pages/thesis/thesis_view.dart';
class MyRepositoryPage extends StatelessWidget {
  MyRepositoryPage({Key? key}) : super(key: key);
  final thesisController = Get.put(ThesisController());
  final thesisDocumentController = Get.put(ThesisDocumentController());
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
              if (thesisController.listData.length > 0) {
                
return ListView.builder(
                  itemCount: thesisController.listData.length,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                        onTap: () {
                          thesisDocumentController
                              .getByThesisId(thesisController.listData[i].id);
                          Get.to(() => ThesisDetailsPage(), arguments: {
                            "id": thesisController.listData[i].id
                          });
                        },
                      leading: FlutterLogo(size: 72.0),
                      title: Text(stringFormating.truncateWithEllipsis(
                          20, thesisController.listData[i].title.toString())),
                      subtitle: Text(stringFormating.truncateWithEllipsis(60,
                          thesisController.listData[i].abstract.toString())),
                        trailing: PopUpMenuComponent(menuList: [
                          PopupMenuItem(
                              child: ListTile(
                            title: Text("Perbaharui Data"),
                            onTap: () {
                              print(thesisController.listData[i].id);
                              Get.to(() => ThesisEditView(), arguments: {
                                "id": thesisController.listData[i].id
                              });
                            },
                          )),
                          PopupMenuItem(
                              child: ListTile(
                            title: Text("Hapus"),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomPopUpDialog(
                                      title: 'Hapus Data',
                                      desc: 'Yakin ingin menghapus data?',
                                      button: [
                                        SolidButton(
                                          onTap: () {
                                            thesisController
                                                .deleteThesis(thesisController
                                                    .listData[i].id)
                                                .then((value) {
                                              if (value) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.blue,
                                                  content: Text(
                                                      'Data Berhasil Dihapus'),
                                                ));
                                              } else {
                                                Navigator.pop(context);

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content:
                                                      Text(value.toString()),
                                                ));
                                              }
                                            });
                                          },
                                          title: 'Hapus',
                                          width: 120,
                                          color: Colors.red,
                                        ),
                                        OutlineButton(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          title: 'Batalkan',
                                          width: 120,
                                          color: Colors.red,
                                          textColor: Colors.red,
                                        )
                                      ],
                                    );
                                  });
                            },
                          ))
                        ], icons: Icon(Icons.more_vert)),
                      isThreeLine: true,
                    );
                  });
              } else {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 350,
                        child: LottieBuilder.asset(
                            'assets/images/lottie/not-found.json'),
                      ),
                      Text(
                        'Kamu Belum Punya Repository',
                        style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )
                    ],
                  ),
                );
              }
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
