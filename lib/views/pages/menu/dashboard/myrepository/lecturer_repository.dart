import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/InternalResearch/internal_research_controller.dart';
import 'package:warebook_mobile/controllers/Journal/journal_topic_controller.dart';
import 'package:warebook_mobile/helpers/string_formating.dart';
import 'package:warebook_mobile/views/components/button/outline_button.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';
import 'package:warebook_mobile/views/components/popup/custom_dialog.dart';
import 'package:warebook_mobile/views/components/popup/custom_pop_up_menu.dart';
import 'package:warebook_mobile/views/pages/internalResearch/edit_internal_research_repo.dart';
import 'package:warebook_mobile/views/pages/internalResearch/internal_research_view.dart';
import 'package:warebook_mobile/views/pages/journal/create_repo_journal.dart';
import 'package:warebook_mobile/views/pages/journal/journal_topic/edit_repo_journal_topic.dart';
import 'package:warebook_mobile/views/pages/journal/journal_topic/journal_topic.dart';
import 'package:warebook_mobile/views/pages/journal/manage_journal_repo.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/dashboard.dart';

class DosenRepositoryPage extends StatelessWidget {
  
  int activePage;
  DosenRepositoryPage({Key? key, this.activePage = 0}) : super(key: key);

  final internalResearchController = Get.put(InternalResearchController());
  final journalTopicController = Get.put(JournalTopicController());
  final stringFormating = StringFormating();

  @override
  Widget build(BuildContext context) {
    internalResearchController.getAllDataByAuth();
    journalTopicController.getAllDataByAuth();
    return DefaultTabController(
        initialIndex: activePage,
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
            
            Obx(() {
              if (journalTopicController.listData.length > 0) {
                return ListView.builder(
                    itemCount: journalTopicController.listData.length,
                    itemBuilder: (ctx, i) {
                      return ListTile(
                        onTap: () {
                          journalTopicController.getJournalTopicDetails(
                              journalTopicController.listData[i].id);
                          Get.to(() => JournalTopicView(), arguments: {
                            "id": journalTopicController.listData[i].id
                          });
                        },
                        leading: SvgPicture.asset(
                          ImagePath.folder,
                          height: 72.0,
                        ),
                        title: Text(
                            stringFormating.truncateWithEllipsis(
                                20,
                                journalTopicController.listData[i].title
                                    .toString()),
                            style: TextStyle(fontFamily: 'Nunito Sans')),
                        subtitle: Text(stringFormating.truncateWithEllipsis(
                            60,
                            journalTopicController.listData[i].description
                                .toString())),
                        trailing: PopUpMenuComponent(menuList: [
                          PopupMenuItem(
                              child: ListTile(
                            title: Text("Kelola Jurnal"),
                            onTap: () {
                              Get.to(() => ManageJournalRepo(), arguments: {
                                'id': journalTopicController.listData[i].id
                              });
                            },
                          )),
                          PopupMenuItem(
                              child: ListTile(
                            title: Text("Perbaharui Data"),
                            onTap: () {
                              Get.to(() => EditJournalTopic(), arguments: {
                                "id": journalTopicController.listData[i].id
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
                                      desc:
                                          'Yakin ingin menghapus Repository Journal?',
                                      button: [
                                        SolidButton(
                                          onTap: () {
                                            journalTopicController
                                                .deleteJournalTopic(
                                                    journalTopicController
                                                        .listData[i].id)
                                                .then((value) {
                                              if (value) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.blue,
                                                  content: Text(
                                                      'Jurnal Berhasil Dihapus'),
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
            Obx(() {
              if (internalResearchController.listData.length > 0) {
                return ListView.builder(
                    itemCount: internalResearchController.listData.length,
                    itemBuilder: (ctx, i) {
                      return ListTile(
                        onTap: () {
                          internalResearchController.getInternalResearctDetails(
                              internalResearchController.listData[i].id);
                          Get.to(() => InternalResearchDetailsPage(),
                              arguments: {
                                "id": internalResearchController.listData[i].id
                              });
                        },
                        leading: SvgPicture.asset(
                          ImagePath.folder,
                          height: 72.0,
                        ),
                        title: Text(
                            stringFormating.truncateWithEllipsis(
                                20,
                                internalResearchController.listData[i].title
                                    .toString()),
                            style: TextStyle(fontFamily: 'Nunito Sans')),
                        subtitle: Text(stringFormating.truncateWithEllipsis(
                            60,
                            internalResearchController.listData[i].abstract
                                .toString())),
                        trailing: PopUpMenuComponent(menuList: [
                          PopupMenuItem(
                              child: ListTile(
                            title: Text("Perbaharui Data"),
                            onTap: () {
                              Get.to(() => InternalResearchEditView(),
                                  arguments: {
                                    "id": internalResearchController
                                        .listData[i].id
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
                                      desc:
                                          'Yakin ingin menghapus Repository Pengabdian?',
                                      button: [
                                        SolidButton(
                                          onTap: () {
                                            internalResearchController
                                                .deleteInternalResearch(
                                                    internalResearchController
                                                        .listData[i].id)
                                                .then((value) {
                                              if (value) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.blue,
                                                  content: Text(
                                                      'Pengabdian Berhasil Dihapus'),
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
            })
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
