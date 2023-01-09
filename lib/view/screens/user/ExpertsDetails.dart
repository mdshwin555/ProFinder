import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:project2022/main.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import '../../../Logic/Api/Controllers/ExpertController.dart';
import '../../../constants/fonts.dart';
import '../../../constants/images.dart';
import 'package:project2022/constants/colors.dart';
import '../../../constants/routes.dart';
import 'conExperts.dart';
import '../../../Logic/Api/Controllers/AuthController.dart';

class ExpertsDtails extends StatefulWidget {
  @override
  State<ExpertsDtails> createState() => _ExpertsDtailsState();
}

class _ExpertsDtailsState extends State<ExpertsDtails> {
  String? path = sharedPref?.getString("path");
  bool val = sharedPref?.getBool("val") == false ? false : true;
  bool height1 = false;
  bool height2 = false;
  bool fav = false;
  bool star = false;
  double rating = 0;
  var addtofav;
  int? hg;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<dynamic>(
          future: ExpertController.getexpert(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
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
            if (snapshot.hasData) {
              return Container(
                alignment: Alignment.center,
                height: double.infinity,
                width: 100.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: -40.h,
                      right: -18.w,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Images.two),
                        radius: 200.sp,
                      ),
                    ),
                    Positioned(
                      child: SizedBox(
                        height: double.infinity,
                        width: 100.w,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height:hg==15?90.h:hg==23?100.h:hg==29?106.h: hg==36?127.h:150.h, //@@@@#########<<<<<<<<<
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 6.w,
                                      top: 15.h,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 36.h,
                                        width: 88.w,
                                        decoration: BoxDecoration(
                                          color: Color(color.white),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.45),
                                              blurRadius: 25,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 3.h,
                                            left: 5.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 5.h,
                                      left: 30.w,
                                      child: CircleAvatar(
                                        radius: 65.sp,
                                        backgroundColor: Color(color.white),
                                        child: CircleAvatar(
                                          radius: 60.sp,
                                          backgroundColor: Color(color.orange),
                                          foregroundImage: AssetImage(
                                              'Platform/public/images/expert/${snapshot.data['0'][0]['photo']}'),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 18.h,
                                      right: 12.w,
                                      child: InkWell(
                                        onTap: () {
                                          var favr = ExpertController.addtofav(
                                              expert_id:
                                                  '${snapshot.data['0'][0]['id']}',
                                              token:
                                                  '${sharedPref?.getString('access_token')}');
                                          if (favr == true)
                                            print('favorite done');
                                          setState(() {
                                            fav = true;
                                            sharedPref?.setBool("fav", fav);
                                          });
                                        },
                                        child: Icon(
                                          sharedPref?.getBool("fav") == false
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 25.sp,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 18.h,
                                      left: 12.w,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            star = true;
                                            sharedPref?.setBool("star", star);
                                            Get.dialog(
                                              Container(
                                                padding: EdgeInsets.only(
                                                    bottom: 16.h),
                                                height: 50.h,
                                                width: 90.w,
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Positioned(
                                                      top: 38.h,
                                                      child: Container(
                                                        height: 40.h,
                                                        width: 90.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.sp),
                                                        ),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 11.h),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                'Enjoying Expertio ? ',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  color: Color(
                                                                      color
                                                                          .blue),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 2.h,
                                                              ),
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                'How would you rate our app ? ',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  color: Color(
                                                                      color
                                                                          .blue),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 1.h,
                                                              ),
                                                              SizedBox(
                                                                height: 2.h,
                                                              ),
                                                              RatingBar.builder(
                                                                  initialRating:
                                                                      rating,
                                                                  updateOnDrag:
                                                                      true,
                                                                  itemPadding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          4),
                                                                  itemSize: 46,
                                                                  minRating: 1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          _) {
                                                                    return const Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .amber,
                                                                    );
                                                                  },
                                                                  onRatingUpdate:
                                                                      (rating) {
                                                                    setState(
                                                                        () {
                                                                      this.rating =
                                                                          rating;
                                                                      print(rating
                                                                          .toInt());
                                                                    });
                                                                  }),
                                                              SizedBox(
                                                                height: 2.h,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Get.back();
                                                                  var rate = ExpertController.addrate(
                                                                      rate:
                                                                          '${rating.toInt()}',
                                                                      expert_id:
                                                                          '${snapshot.data['0'][0]['id']}');

                                                                  if (rate !=
                                                                      true)
                                                                    print(
                                                                        'error rate');
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: 7.w,
                                                                    right: 7.w,
                                                                  ),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 8.h,
                                                                  width: 78.w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        color
                                                                            .orange),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                  child: Text(
                                                                    'OK, SURE',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xffffffff),
                                                                      fontSize:
                                                                          20.sp,
                                                                      fontFamily:
                                                                          Fonts
                                                                              .a,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      radius: 50.sp,
                                                      backgroundColor:
                                                          Color(color.red),
                                                      child: Icon(
                                                        Icons.favorite,
                                                        color: Colors.white,
                                                        size: 40.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                        },
                                        child: Icon(
                                          sharedPref?.getBool("star") == false
                                              ? Icons.star_border
                                              : Icons.star,
                                          size: 25.sp,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 26.h,
                                      left: 10.w,
                                      right: 10.w,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 90.w,
                                        child: Text(
                                          '${snapshot.data['0'][0]['name']}',
                                          style: TextStyle(
                                            letterSpacing: 0.8,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: Fonts.g,
                                            fontSize: 20.sp,
                                            color: Color(color.blue),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 30.h,
                                      left: 5.w,
                                      child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return  Container(
                                            padding: EdgeInsets.only(left: 25.w,right: 23.w),
                                            alignment: Alignment.center,
                                            width: 90.w,
                                            child: Text(
                                              snapshot.data['avg'] == null
                                                  ? 'NO RATING 💔 '
                                                  : '${snapshot.data['avg'].toInt() == 1 ? '⭐️' : snapshot.data['avg'].toInt() == 2 ? '⭐️⭐️' : snapshot.data['avg'].toInt() == 3 ? '⭐️⭐️⭐️' : snapshot.data['avg'].toInt() == 4 ? '⭐️⭐️⭐️⭐️' : snapshot.data['avg'].toInt() == 5 ? '⭐️⭐️⭐️⭐️⭐️' : 'NO RATING⭐️'}',
                                              style: TextStyle(
                                                letterSpacing: 0.8,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: Fonts.h,
                                                fontSize: 19.sp,
                                                color: Color(color.blue),
                                              ),
                                            ),
                                          );
                                        },
                                      ),

                                    ),
                                    Positioned(
                                      top: 35.h,
                                      left: -2.5.w,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                Color(color.orange),
                                            radius: 19.sp,
                                            child: Icon(
                                              Icons.phone,
                                              size: 20.sp,
                                              color: Color(color.white),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Phone ',
                                            style: TextStyle(
                                              letterSpacing: 0.8,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Fonts.a,
                                              fontSize: 12.sp,
                                              color: Color(color.gray),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Text(
                                            '+${snapshot.data['0'][0]['phone_number']}',
                                            style: TextStyle(
                                              letterSpacing: 0.8,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Fonts.b,
                                              fontSize: 15.sp,
                                              color: Color(color.blue),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 43.h,
                                      left: -4.w,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 14.w,
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                Color(color.orange),
                                            radius: 19.sp,
                                            child: Icon(
                                              Icons.near_me_outlined,
                                              size: 20.sp,
                                              color: Color(color.white),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Address',
                                            style: TextStyle(
                                              letterSpacing: 0.8,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Fonts.a,
                                              fontSize: 12.sp,
                                              color: Color(color.gray),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Text(
                                            '${snapshot.data['0'][0]['address']}',
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Fonts.b,
                                              fontSize: 17.sp,
                                              color: Color(color.blue),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 54.h,
                                      left: 6.w,
                                      child: Container(
                                        height: height1 == true ? 21.h : 8.h,
                                        width: 88.w,
                                        decoration: BoxDecoration(
                                          color: Color(color.white),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.40),
                                              blurRadius: 25,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: ExpansionTile(
                                          onExpansionChanged: (bool state) {
                                            setState(() {
                                              height1 = state;
                                            });
                                          },
                                          title: Text(
                                            'Experiences',
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Fonts.b,
                                              fontSize: 16.sp,
                                              color: Color(color.blue),
                                            ),
                                          ),
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Color(color.orange),
                                                  radius: 19.sp,
                                                  child: Icon(
                                                    Icons.leaderboard_outlined,
                                                    size: 20.sp,
                                                    color: Color(color.white),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Text(
                                                  'Experience',
                                                  style: TextStyle(
                                                    letterSpacing: 0.8,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: Fonts.a,
                                                    fontSize: 12.sp,
                                                    color: Color(color.gray),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Text(
                                                  '${snapshot.data['0'][0]['experienc'][0]['experience']}',
                                                  style: TextStyle(
                                                    letterSpacing: 0.8,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: Fonts.b,
                                                    fontSize: 15.sp,
                                                    color: Color(color.blue),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.5.h,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Color(color.orange),
                                                  radius: 19.sp,
                                                  child: Icon(
                                                    Icons.details,
                                                    size: 20.sp,
                                                    color: Color(color.white),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Text(
                                                  'Details',
                                                  style: TextStyle(
                                                    letterSpacing: 0.8,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: Fonts.a,
                                                    fontSize: 12.sp,
                                                    color: Color(color.gray),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 14.w,
                                                ),
                                                Text(
                                                  '${snapshot.data['0'][0]['experienc'][0]['details']}',
                                                  style: TextStyle(
                                                    letterSpacing: 0.8,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: Fonts.b,
                                                    fontSize: 15.sp,
                                                    color: Color(color.blue),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: height1 == false ? 65.h : 79.h,
                                      left: 6.w,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: height2 == true ? hg?.h : 8.h,
                                        width: 88.w,
                                        decoration: BoxDecoration(
                                          color: Color(color.white),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.80),
                                              blurRadius: 25,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: FutureBuilder<dynamic>(
                                          future: ExpertController.viewTime(),
                                          builder: (context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Lottie.asset(
                                                      Images.loading,
                                                      height: 10.h,
                                                    ),
                                                    Text(
                                                      'Loading',
                                                      style: TextStyle(
                                                        fontFamily: Fonts.h,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp,
                                                        color:
                                                            Color(color.blue),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            if (snapshot.data.length != 0) {
                                              return ExpansionTile(
                                                onExpansionChanged:
                                                    (bool state) {
                                                  setState(() {
                                                    snapshot.data.length == 1
                                                        ? hg = 15
                                                        :snapshot.data.length == 2?hg = 23: snapshot.data
                                                                    .length ==
                                                                3
                                                            ? hg = 29
                                                            : snapshot.data
                                                                        .length ==
                                                                    4
                                                                ? hg = 36
                                                                : hg = 60;
                                                    height2 = state;
                                                  });
                                                },
                                                title: Text(
                                                  'Times',
                                                  style: TextStyle(
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: Fonts.b,
                                                    fontSize: 16.sp,
                                                    color: Color(color.blue),
                                                  ),
                                                ),
                                                children: [
                                                  for (int ii = 0;
                                                      ii <=
                                                          snapshot.data.length -
                                                              1;
                                                      ii++)
                                                    InkWell(
                                                      onTap: () async {
                                                        sharedPref?.setInt(
                                                            "time_id",
                                                            snapshot.data[ii]
                                                                ['id']);
                                                        var reservetime =
                                                            await ExpertController
                                                                .reserveTime(
                                                          token:
                                                              '${sharedPref?.getString('access_token')}',
                                                        );

                                                        Get.dialog(
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        16.h),
                                                            height: 50.h,
                                                            width: 90.w,
                                                            child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                Positioned(
                                                                  top: 38.h,
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        37.h,
                                                                    width: 90.w,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25.sp),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.only(
                                                                          top: 11
                                                                              .h),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                5.h,
                                                                          ),
                                                                          Text(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            '${reservetime}',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 15.sp,
                                                                              fontWeight: FontWeight.bold,
                                                                              decoration: TextDecoration.none,
                                                                              color: Color(color.blue),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5.h,
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              padding: EdgeInsets.only(
                                                                                left: 7.w,
                                                                                right: 7.w,
                                                                              ),
                                                                              alignment: Alignment.center,
                                                                              height: 8.h,
                                                                              width: 78.w,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(color.orange),
                                                                                borderRadius: BorderRadius.circular(25),
                                                                              ),
                                                                              child: Text(
                                                                                'OK, SURE',
                                                                                style: TextStyle(
                                                                                  color: Color(0xffffffff),
                                                                                  fontSize: 20.sp,
                                                                                  fontFamily: Fonts.a,
                                                                                  decoration: TextDecoration.none,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                CircleAvatar(
                                                                  radius: 50.sp,
                                                                  backgroundColor:reservetime ==
                                                                      'Reservation successful'?Colors.green:
                                                                      Color(color
                                                                          .red),
                                                                  child: reservetime ==
                                                                          'Sorry, you have to wait for next week'
                                                                      ? Icon(
                                                                          Icons
                                                                              .heart_broken,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              40.sp,
                                                                        )
                                                                      :reservetime ==
                                                                      'Reservation successful'? Icon(
                                                                          Icons
                                                                              .done_all_outlined,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              40.sp,
                                                                        ):reservetime ==
                                                                      'Sorry, time is taken'?Icon(
                                                                    Icons
                                                                        .update_disabled_outlined,
                                                                    color:
                                                                    Colors.white,
                                                                    size:
                                                                    40.sp,
                                                                  ):Icon(
                                                                    Icons
                                                                        .account_balance_wallet_outlined,
                                                                    color:
                                                                    Colors.white,
                                                                    size:
                                                                    40.sp,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 1.h),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 4.w,
                                                            ),
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Color(color
                                                                      .orange),
                                                              radius: 19.sp,
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
                                                              'Time ${ii + 1}',
                                                              style: TextStyle(
                                                                letterSpacing:
                                                                    0.8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    Fonts.a,
                                                                fontSize: 12.sp,
                                                                color: Color(
                                                                    color.gray),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 8.w,
                                                            ),
                                                            Text(
                                                              '${snapshot.data[ii]['time']}',
                                                              style: TextStyle(
                                                                letterSpacing:
                                                                    0.8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    Fonts.b,
                                                                fontSize: 15.sp,
                                                                color: Color(
                                                                    color.blue),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              );
                                            } else {
                                              return Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Lottie.asset(
                                                      Images.loading,
                                                      height: 10.h,
                                                    ),
                                                    Text(
                                                      'Loading',
                                                      style: TextStyle(
                                                        fontFamily: Fonts.h,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp,
                                                        color:
                                                            Color(color.blue),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 3.h,
                      left: 6.w,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
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
          },
        ),
        floatingActionButton: Row(
          children: [
            SizedBox(
              width: 8.w,
            ),
            Container(
                alignment: Alignment.center,
                height: 8.h,
                width: 18.w,
                decoration: BoxDecoration(
                  color: Color(color.orange),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 22.sp,
                )),
            SizedBox(
              width: 3.w,
            ),
            Container(
                alignment: Alignment.center,
                height: 8.h,
                width: 18.w,
                decoration: BoxDecoration(
                  color: Color(color.orange),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.message_outlined,
                  color: Colors.white,
                  size: 22.sp,
                )),
            SizedBox(
              width: 3.w,
            ),
            Container(
              alignment: Alignment.center,
              height: 8.h,
              width: 49.w,
              decoration: BoxDecoration(
                color: Color(color.orange),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                'Book appoitment ',
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 14.sp,
                  fontFamily: Fonts.a,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
