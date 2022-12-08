import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/fonts.dart';
import '../../../constants/images.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              Images.nofav,
              height: 30.h,
            ),
            Text(
              'Favorites is empty',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                fontFamily: Fonts.a,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text('There are currently no favorite experts for this volume',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: Fonts.h,
              ),),
          ],
        ),
      ),
    );
  }
}
