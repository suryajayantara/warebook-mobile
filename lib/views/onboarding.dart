import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warebook_mobile/commons/asset_path.dart';
import 'package:warebook_mobile/themes/colors.dart';
import 'package:warebook_mobile/views/components/button/solid_button.dart';
import 'package:warebook_mobile/views/components/onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<Widget> _onBoardPageList = [
    OnboardPage(
        imgUrl: ImagePath.firstOnboarding,
        title: 'Temukan Inspirasimu',
        desc:
            "Temukan ide ide brilian dari apa yang telah dibuat oleh kakak kakakmu terdahulu"),
    OnboardPage(
        imgUrl: ImagePath.secondOnboarding,
        title: 'Temukan Inspirasimu',
        desc:
            "Temukan ide ide brilian dari apa yang telah dibuat oleh kakak kakakmu terdahulu"),
    OnboardPage(
        imgUrl: ImagePath.thirdOnboarding,
        title: 'Temukan Inspirasimu',
        desc:
            "Temukan ide ide brilian dari apa yang telah dibuat oleh kakak kakakmu terdahulu")
  ];

  // Variable init
  PageController _pvController = new PageController(initialPage: 0);
  int activePage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pvController,
          children: _onBoardPageList,
          onPageChanged: (index) {
            print(index);
            setState(() {
              activePage = index + 1;
            });
          },
        ),
        Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_onBoardPageList.length, (index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 60, left: 8),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: activePage - 1 == index
                              ? Colors.blue
                              : Colors.blue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50)),
                    );
                  }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: SolidButton(
                    color: ColorsTheme.lightBlue,
                    title: "Selanjutnya",
                    onTap: () {},
                  ),
                )
              ],
            ))
      ],
    ));
  }
}
