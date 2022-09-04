import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/controllers/Auth/login_controller.dart';
import 'package:warebook_mobile/controllers/Auth/user_controller.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/Card/card.dart';
import 'package:warebook_mobile/views/components/button/outline_button.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';
import 'package:warebook_mobile/views/components/popup/custom_dialog.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/myrepository/lecturer_repository.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/myrepository/student_repository.dart';
import 'package:warebook_mobile/views/pages/repository/select_repository_type_view.dart';
import 'package:warebook_mobile/views/pages/search/search_select.dart';
import 'package:warebook_mobile/views/pages/thesis/create_repo_thesis.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  GetStorage dataStorage = GetStorage('auth');
  final _loginController = Get.put(LoginController());

  // sandbox
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => SelectRepositoryTypeView());
        },
        child: Icon(Icons.file_upload_rounded),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: Get.width,
                  color: ColorsTheme.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 25),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            ImagePath.whiteLogo,
                            height: 35,
                            color: ColorsTheme.white,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.logout_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomPopUpDialog(
                                      title: 'Logout',
                                      desc:
                                          'Yakin ingin Logout dari Aplikasi ini ?',
                                      button: [
                                        SolidButton(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          title: 'Batalkan',
                                          width: 120,
                                          color: Colors.red,
                                        ),
                                        OutlineButton(
                                          onTap: () {
                                            _loginController.logoutMethod();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Colors.blue,
                                              content: Text('Berhasil Logout'),
                                            ));
                                          },
                                          title: 'Logout',
                                          width: 120,
                                          color: Colors.red,
                                          textColor: Colors.red,
                                        )
                                      ],
                                    );
                                  });
                            },
                          )
                        ]),
                  ),
                  height: 120,
                ),
                Container(
                  height: 170,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.symmetric(vertical: 80, horizontal: 25),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Menu',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        ImagePath.repo,
                                        height: 50,
                                      ),
                                      Text(
                                        'Cari Repository',
                                        style: TextStyle(
                                            fontFamily: 'Nunito Sans',
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Colors.black.withOpacity(0.4)),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Get.to(() => SearchSelectorRepository());
                                  },
                                ),
                                GestureDetector(
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          ImagePath.folder,
                                          height: 50,
                                        ),
                                        Text(
                                          'Repository Ku',
                                          style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black
                                                  .withOpacity(0.4)),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      print(dataStorage.read('role'));
                                      if (dataStorage.read('role') ==
                                          'student') {
                                        Get.to(() => MyRepositoryPage());
                                      } else {
                                        Get.to(() => DosenRepositoryPage());
                                      }
                                    }),
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                      ImagePath.setting,
                                      height: 50,
                                    ),
                                    Text(
                                      'Pengaturan',
                                      style: TextStyle(
                                          fontFamily: 'Nunito Sans',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.4)),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            )
          ],
        ),
      )),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.abc)),
      //   BottomNavigationBarItem(icon: Icon(Icons.abc))
      // ]),
    );
  }
}
