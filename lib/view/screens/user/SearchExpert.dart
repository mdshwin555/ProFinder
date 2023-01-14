import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../Logic/Api/Controllers/SearchController.dart';
import '../../../constants/fonts.dart';
import '../../../constants/images.dart';
import '../../../constants/colors.dart';
import '../../../main.dart';
import 'ExpertsDetails.dart';

class SearchExpert extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: SearchController.searchExpert(query),
      builder:(context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.asset(
              Images.loading,
              height: 10.h,
            ),
          );
        }
        if(snapshot.data.length!=0)
          return GridView.builder(
           itemCount:snapshot.data.length,
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
              return InkWell(
                onTap: (){
                  Get.to(ExpertsDtails());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.sp),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          Images.exwall,
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
                          left: 2.w,
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
                              left: 1.w,
                              child:Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  '${snapshot.data[0]['name']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontFamily: Fonts.d,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 1.w,
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  snapshot.data[index]['consulting_id']==1?'medical':snapshot.data[index]['consulting_id']==2?'Profession':snapshot.data[index]['consulting_id']==3?'Mental':snapshot.data[index]['consulting_id']==4?'Familial':'Business',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: Fonts.a,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        else
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Lottie.asset(
                  Images.noitems,
                  height: 30.h,
                ),
                sharedPref?.getString("lang") == "ar"?Text(
                  'nosearch'.tr,
                  style: TextStyle(
                    fontFamily: Fonts.j,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Color(color.blue),
                  ),
                ):Text(
                  'nosearch'.tr,
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
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Lottie.asset(
              Images.search,
              height: 30.h,
            ),
            Text(
              'No suggestion experts yet ',
              style: TextStyle(
                fontFamily: Fonts.h,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: Color(color.blue),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
