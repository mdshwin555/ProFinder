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
      child: sharedPref?.getString("role")=="User"?Scaffold(
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
              sharedPref?.setInt("id",snapshot.data[0]['expert_id']);
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
                            'Platform/public/images/expert/1673133848.jpg',
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
                                bottom: 1.h,
                                right: 1.w,
                                left: 1.w,

                                child:FutureBuilder<dynamic>(
                                  future: ExpertController.getexpert(),
                                  builder:
                                      (context, AsyncSnapshot<dynamic> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${sharedPref?.getString("ex_name")}',
                                          style: TextStyle(
                                            fontFamily: Fonts.d,
                                            fontSize: 16.sp,
                                            color: Color(color.white),
                                          ),
                                        ),
                                      );
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      sharedPref?.setString(
                                          "ex_name", "${snapshot.data['0'][0]['name']}");

                                      return Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${snapshot.data['0'][0]['name']}',
                                          style: TextStyle(
                                            fontFamily: Fonts.d,
                                            fontSize: 16.sp,
                                            color: Color(color.white),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${sharedPref?.getString("ex_name")}',
                                          style: TextStyle(
                                            fontFamily: Fonts.d,
                                            fontSize: 16.sp,
                                            color: Color(color.white),
                                          ),
                                        ),
                                      );
                                    }
                                  },
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
      ):Scaffold(
        body: Stack(
          children:[
            Container(
              height: 37.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      Images.two,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.sp),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 45.h),
              child: FutureBuilder<dynamic>(
                future: ExpertController.veiwReservation(),
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
                              color: Color(color.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (snapshot.data.length!=0) {
                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      itemBuilder: (c, i) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                          height: 11.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15.sp,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.20),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 4.w,
                              ),
                              CircleAvatar(
                                backgroundColor:
                                Color(color
                                    .orange),
                                radius: 25.sp,
                                child: Icon(
                                  Icons
                                      .access_time_rounded,
                                  size: 20.sp,
                                  color: Color(
                                      color
                                          .white),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                '${snapshot.data[i]['day']}/${DateTime.now().month.toString()}/2023:',
                                style: TextStyle(
                                  letterSpacing:
                                  0.8,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  fontFamily:
                                  Fonts.a,
                                  fontSize: 14.sp,
                                  color: Color(
                                      color.gray),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                '${snapshot.data[i]['period']}',
                                style: TextStyle(
                                  letterSpacing:
                                  0.8,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  fontFamily:
                                  Fonts.d,
                                  fontSize: 15.sp,
                                  color: Color(
                                      color.blue),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 2.h,
                        );
                      },
                    );

                  }
                  else  {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Lottie.asset(
                            Images.noitems,
                            height: 25.h,
                          ),
                          sharedPref?.getString("lang") == "ar"?Text(
                            'noreserv'.tr,
                            style: TextStyle(
                              fontFamily: Fonts.j,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Color(color.blue),
                            ),
                          ):Text(
                            'noreserv'.tr,
                            style: TextStyle(
                              fontFamily: Fonts.h,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Color(color.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            sharedPref?.getString("lang") == "ar"?Container(
              padding: EdgeInsets.only(top: 40.h,right: 5.w),
              child: Text(
                'times'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.j,
                  fontSize: 15.sp,
                  color: Color(color.blue),
                ),
              ),
            ):Container(
              padding: EdgeInsets.only(top: 40.h,left: 5.w),
              child: Text(
                'times'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.d,
                  fontSize: 15.sp,
                  color: Color(color.blue),
                ),
              ),
            ),
            FutureBuilder<dynamic>(
              future: ExpertController.veiwReservation(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return  Stack(
                    children: [
                      Positioned(
                        top: 6.h,
                        left: 5.w,
                        child: Image.asset(
                          Images.credit,
                          width: 90.w,
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        left: 37.w,
                        child: Text(
                          '${sharedPref?.getString("balance")}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.yellow,
                            fontFamily: Fonts.d,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25.5.h,
                        left: 15.w,
                        child: Text(
                          '${sharedPref?.getString("name")}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.yellow,
                            fontFamily: Fonts.d,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.data.length!=0) {
                  return  Stack(
                    children: [
                      Positioned(
                        top: 6.h,
                        left: 5.w,
                        child: Image.asset(
                          Images.credit,
                          width: 90.w,
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        left: 37.w,
                        child: Text(
                          '${int.parse('${sharedPref?.getString("balance")}')+int.parse('${sharedPref?.getString("price")}')*snapshot.data.length}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.yellow,
                            fontFamily: Fonts.d,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25.5.h,
                        left: 15.w,
                        child: Text(
                          '${sharedPref?.getString("name")}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.yellow,
                            fontFamily: Fonts.d,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                else  {
                  return Stack(
                    children: [
                      Positioned(
                        top: 6.h,
                        left: 5.w,
                        child: Image.asset(
                          Images.credit,
                          width: 90.w,
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        left: 37.w,
                        child: Text(
                          '${int.parse('${sharedPref?.getString("balance")}')}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.yellow,
                            fontFamily: Fonts.d,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25.5.h,
                        left: 15.w,
                        child: Text(
                          '${sharedPref?.getString("name")}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.yellow,
                            fontFamily: Fonts.d,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ]
        ),
      ),
    );
  }
}
