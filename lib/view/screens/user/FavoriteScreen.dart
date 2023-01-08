import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../Logic/Api/Controllers/ExpertController.dart';
import '../../../constants/fonts.dart';
import '../../../constants/images.dart';
import '../../../main.dart';
import 'ExpertsDetails.dart';
import 'package:project2022/constants/colors.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<dynamic>(
          future: ExpertController.showfav(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      Images.loading,
                      height: 10.h,
                    ),
                    Text(
                      'Loading',
                      style: TextStyle(
                        fontFamily: Fonts.h,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.data.length != 0) {
              return GridView.builder(
                itemCount: snapshot.data.length,
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
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.sp),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Images.address,
                          ),
                          fit: BoxFit.cover,
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
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 20.sp,
                                ),
                              ),
                              Positioned(
                                bottom: 2.5.h,
                                right: 16.w,
                                child: Text(
                                  '${snapshot.data[index]['expert_id']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            else {
              return Center(
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
                    Text(
                      'There are currently no favorite experts for this volume',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: Fonts.h,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
