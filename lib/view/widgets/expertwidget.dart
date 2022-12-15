// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:lottie/lottie.dart';
// import 'package:project2022/Logic/Api/Models/expertmodel.dart';
// import 'package:sizer/sizer.dart';
// import '../../Logic/Api/Models/expertmodel.dart';
// import '../../Logic/Api/Models/expertmodel.dart';
// import '../../constants/fonts.dart';
// import '../../constants/images.dart';
// import '../../constants/routes.dart';
// import 'package:project2022/constants/colors.dart';
// import 'package:project2022/constants/fonts.dart';
//
// class ExpertWidget extends StatelessWidget {
//   final List<expertmodel> expert =[];
//
//   List images = [
//     Images.medical,
//     Images.proffisional,
//     Images.mental,
//     Images.family,
//     Images.business,
//   ];
//
//   List titles = [
//     'Medical',
//     'professional',
//     'Mental',
//     'familial',
//     'Business',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(
//             expert[1].photo!,
//           ),
//           fit: BoxFit.fill,
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.transparent,
//               Colors.black.withOpacity(0.75),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//           borderRadius: BorderRadius.circular(10.sp),
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(
//             left: 5.w,
//             bottom: 2.h,
//           ),
//           child: Stack(
//             alignment: Alignment.bottomLeft,
//             children: [
//               Positioned(
//                 top: 2.h,
//                 right: 4.w,
//                 child: Icon(
//                   Icons.favorite,
//                   color: Color(color.red),
//                   size: 20.sp,
//                 ),
//               ),
//               Positioned(
//                 bottom: 2.5.h,
//                 right: 16.w,
//                 child: Text(
//                   expert[1].name!,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15.sp,
//                     fontFamily: Fonts.a,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 16.w,
//                 child: Text(
//                   expert[1].address!,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 10.sp,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
