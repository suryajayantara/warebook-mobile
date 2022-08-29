import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/StudentCreativityProgram/student_creativity_program_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_controller.dart';
import 'package:warebook_mobile/controllers/Thesis/thesis_document_controller.dart';
import 'package:warebook_mobile/helpers/string_formating.dart';
import 'package:warebook_mobile/views/components/button/outline_button.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';
import 'package:warebook_mobile/views/components/popup/custom_pop_up_menu.dart';
import 'package:warebook_mobile/views/components/popup/custom_dialog.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/dashboard.dart';
import 'package:warebook_mobile/views/pages/studentResearch/edit_repo_student_creativity_program.dart';
import 'package:warebook_mobile/views/pages/studentResearch/student_research_view.dart';
import 'package:warebook_mobile/views/pages/thesis/edit_repo_thesis.dart';
import 'package:warebook_mobile/views/pages/thesis/manage_thesis_document_repo.dart';
import 'package:warebook_mobile/views/pages/thesis/thesis_view.dart';

class MyRepositoryPage extends StatelessWidget {
  int activePage;
  MyRepositoryPage({Key? key, this.activePage = 0}) : super(key: key);

  final thesisController = Get.put(ThesisController());
  final studentCreativityProgramController =
      Get.put(StudentCreativityProgramController());
  final thesisDocumentController = Get.put(ThesisDocumentController());
  final stringFormating = StringFormating();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
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
                          leading: SvgPicture.asset(
                            ImagePath.folder,
                            height: 72.0,
                          ),
                          title: Text(
                              stringFormating.truncateWithEllipsis(
                                  20,
                                  thesisController.listData[i].title
                                      .toString()),
                              style: TextStyle(fontFamily: 'Nunito Sans')),
                          subtitle: Text(stringFormating.truncateWithEllipsis(
                              60,
                              thesisController.listData[i].abstract
                                  .toString())),
                          trailing: PopUpMenuComponent(menuList: [
                            PopupMenuItem(
                                child: ListTile(
                              title: Text("Kelola Dokumen"),
                              onTap: () {
                                Get.to(() => ManageThesisDocumentPage(),
                                    arguments: {
                                      "id": thesisController.listData[i].id
                                    });
                              },
                            )),
                            PopupMenuItem(
                                child: ListTile(
                              title: Text("Perbaharui Data"),
                              onTap: () {
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
                                                    backgroundColor:
                                                        Colors.blue,
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
              Obx(() {
                if (studentCreativityProgramController.listData.length > 0) {
                  return ListView.builder(
                      itemCount:
                          studentCreativityProgramController.listData.length,
                      itemBuilder: (ctx, i) {
                        return ListTile(
                          onTap: () {
                            studentCreativityProgramController
                                .getStudentCreativityProgramDetails(
                                    studentCreativityProgramController
                                        .listData[i].id);
                            Get.to(() => StudentCreativityProgramView(),
                                arguments: {
                                  "id": studentCreativityProgramController
                                      .listData[i].id
                                });
                          },
                          leading: SvgPicture.asset(
                            ImagePath.folder,
                            height: 72.0,
                          ),
                          title: Text(
                              stringFormating.truncateWithEllipsis(
                                  20,
                                  studentCreativityProgramController
                                      .listData[i].title
                                      .toString()),
                              style: TextStyle(fontFamily: 'Nunito Sans')),
                          subtitle: Text(stringFormating.truncateWithEllipsis(
                              60,
                              studentCreativityProgramController
                                  .listData[i].abstract
                                  .toString())),
                          trailing: PopUpMenuComponent(menuList: [
                            PopupMenuItem(
                                child: ListTile(
                              title: Text("Perbaharui Data"),
                              onTap: () {
                                Get.to(
                                    () =>
                                        EditRepoStudentCreativityProgramView(),
                                    arguments: {
                                      "id": studentCreativityProgramController
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
                                            'Yakin ingin menghapus Repository PKM?',
                                        button: [
                                          SolidButton(
                                            onTap: () {
                                              studentCreativityProgramController
                                                  .deleteStudentCreativityProgram(
                                                      studentCreativityProgramController
                                                          .listData[i].id)
                                                  .then((value) {
                                                if (value) {
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        Colors.blue,
                                                    content: Text(
                                                        'PKM Berhasil Dihapus'),
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
            ]),
          )),
    );
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
