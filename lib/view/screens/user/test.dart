// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// class test extends StatelessWidget {
//   const test({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Positioned(
//         height: 5.h,
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Positioned(
//                   left: 6.w,
//                   top: 15.h,
//                   child: Container(
//                     height: 50.h,
//                     width: 88.w,
//                     decoration: BoxDecoration(
//                       color: Color(color.white),
//                       borderRadius: BorderRadius.circular(25),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.80),
//                           blurRadius: 25,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         top: 3.h,
//                         left: 5.w,
//                       ),
//                     ),
//                   ),
//                 ),
//                 StatefulBuilder(
//                   builder: (context, setState) {
//                     return Stack(
//                       alignment: Alignment.bottomLeft,
//                       children: [
//                         Positioned(
//                           top: 5.h,
//                           left: 30.w,
//                           child: CircleAvatar(
//                             radius: 65.sp,
//                             backgroundColor: Color(color.white),
//                             child: CircleAvatar(
//                               radius: 60.sp,
//                               backgroundColor: Color(color.orange),
//                               foregroundImage:
//                               path == null ? null : FileImage(File(path!)),
//                               child: Image.asset(
//                                 Images.expert,
//                                 height: 12.h,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//                 Positioned(
//                   top: 26.h,
//                   left: 40.w,
//                   child: Text(
//                     'Ahmad',
//                     style: TextStyle(
//                       letterSpacing: 0.8,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: Fonts.g,
//                       fontSize: 20.sp,
//                       color: Color(color.blue),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 30.h,
//                   left: 33.w,
//                   child: Text(
//                     '⭐️⭐️⭐️⭐️⭐️',
//                     style: TextStyle(
//                       letterSpacing: 0.8,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: Fonts.g,
//                       fontSize: 19.sp,
//                       color: Color(color.blue),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 37.h,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 12.w,
//                       ),
//                       Image.asset(
//                         Images.phone,
//                         height: 33.sp,
//                       ),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       Text(
//                         '+963 957 587 296',
//                         style: TextStyle(
//                           letterSpacing: 0.8,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: Fonts.b,
//                           fontSize: 15.sp,
//                           color: Color(color.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: 46.h,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 12.w,
//                       ),
//                       Image.asset(
//                         Images.email,
//                         height: 33.sp,
//                       ),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       Text(
//                         'ahmad@gmail.com',
//                         style: TextStyle(
//                           letterSpacing: 0.8,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: Fonts.c,
//                           fontSize: 16.sp,
//                           color: Color(color.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: 55.h,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 12.w,
//                       ),
//                       Image.asset(
//                         Images.address,
//                         height: 33.sp,
//                       ),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       Text(
//                         'Damascus',
//                         style: TextStyle(
//                           letterSpacing: 0.8,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: Fonts.b,
//                           fontSize: 16.sp,
//                           color: Color(color.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: 69.h,
//                   left: 5.w,
//                   child: Container(
//                     height: height1 == true ? 20.h : 8.h,
//                     width: 88.w,
//                     decoration: BoxDecoration(
//                       color: Color(color.white),
//                       borderRadius: BorderRadius.circular(25),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.80),
//                           blurRadius: 25,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: ExpansionTile(
//                       onExpansionChanged: (bool state) {
//                         setState(() {
//                           height1 = state;
//                         });
//                       },
//                       title: Text(
//                         'Experiances',
//                         style: TextStyle(
//                           letterSpacing: 0.8,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: Fonts.b,
//                           fontSize: 16.sp,
//                           color: Color(color.blue),
//                         ),
//                       ),
//                       leading: Image.asset(
//                         Images.email,
//                         height: 32.sp,
//                       ),
//                       children: [
//                         ListTile(
//                           title: Text('test'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Text('remove'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: height1 == false ? 80.h : 92.h,
//                   left: 5.w,
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: height2 == true ? 20.h : 8.h,
//                     width: 88.w,
//                     decoration: BoxDecoration(
//                       color: Color(color.white),
//                       borderRadius: BorderRadius.circular(25),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.80),
//                           blurRadius: 25,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: ExpansionTile(
//                       onExpansionChanged: (bool state) {
//                         setState(() {
//                           height2 = state;
//                         });
//                       },
//                       title: Text(
//                         'Times',
//                         style: TextStyle(
//                           letterSpacing: 0.8,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: Fonts.b,
//                           fontSize: 16.sp,
//                           color: Color(color.blue),
//                         ),
//                       ),
//                       leading: Image.asset(
//                         Images.time,
//                         height: 33.sp,
//                       ),
//                       children: [
//                         ListTile(
//                           title: Text('test'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Text('remove'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
