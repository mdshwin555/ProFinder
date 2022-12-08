import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/fonts.dart';
import 'package:project2022/constants/colors.dart';

class ExpertDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.custom(
        padding: EdgeInsets.only(
          top: 2.h,
          left: 3.w,
          right: 3.w,
        ),
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          pattern: [
            WovenGridTile(1),
            WovenGridTile(
              5 / 7,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(10.sp),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://picsum.photos/${Random().nextInt(20) + 100}/${Random().nextInt(30) + 80}",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.75),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 5.w,
                    bottom: 2.h,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Positioned(
                        top: 2.h,
                        right: 4.w,
                        child: Icon(
                          Icons.favorite,
                          color: Color(color.red),
                          size: 20.sp,
                        ),
                      ),
                      Positioned(
                        bottom: 2.5.h,
                        right: 16.w,
                        child: Text(
                          'Hello',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: Fonts.a,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16.w,
                        child: Text(
                          '7/10 ⭐️',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
