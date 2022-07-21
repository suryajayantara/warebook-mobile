import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/views/components/BottomNavItem.dart';
import 'package:warebook_mobile/views/components/RepositoryCard.dart';
import 'package:warebook_mobile/views/components/SearchPage.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 35),
        height: 100,
        color: Colors.black.withOpacity(0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              icon: ImagePath.homeDashboard,
              title: 'Beranda',
              isActive: false,
              onTap: () {},
            ),
            BottomNavItem(
              icon: ImagePath.repositoryDashboard,
              title: 'Repositoriku',
              isActive: false,
            ),
            BottomNavItem(
              icon: ImagePath.favoriteDashboard,
              title: 'Favorit',
              isActive: false,
            ),
            BottomNavItem(
              icon: ImagePath.settingDashboard,
              title: 'Menu',
              isActive: false,
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * .33,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/splash-bg.png'))),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/white-icon.svg',
                      height: 38,
                      color: Colors.white,
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/images/dashboard/shutdown.svg',
                      height: 35,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(35),
                child: SearchBar(),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 270, horizontal: 35),
                  child: RepositoryCard()),
            ],
          ),
        ],
      ),
    );
  }
}
