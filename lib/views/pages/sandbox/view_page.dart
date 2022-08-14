// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:warebook_mobile/commons/asset_path.dart';
// import 'package:warebook_mobile/themes/colors.dart';
// import 'package:warebook_mobile/views/components/card/organism/document_card.dart';
// import 'package:warebook_mobile/views/components/card/pill.dart';
// import 'package:warebook_mobile/views/components/users/user_section.dart';

// class ThesisViewPage extends StatelessWidget {
//   const ThesisViewPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           leading: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.arrow_back_ios_new,
//                 color: ColorsTheme.lightBlue,
//               )),
//           title: SvgPicture.asset(
//             ImagePath.smallLogo,
//             height: 35,
//             color: ColorsTheme.lightBlue,
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "How to center a Widget vertically in PreferredSizeWidget",
//                 style: TextStyle(
//                     fontFamily: 'Nunito Sans',
//                     fontSize: 22,
//                     fontWeight: FontWeight.w800),
//               ),
//               Pill(
//                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   text: 'Hello'),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//                       style: TextStyle(
//                           fontFamily: 'Nunito Sans',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14),
//                     )
//                   ],
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   DocumentCard(onTap: () {}, title: 'Nice', desc: "Blunde"),
//                 ],
//               ),
//               UserSection(
//                   userName: 'Risa Rynanda',
//                   userDepartement: 'D3 Manajemen Informatika'),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }
