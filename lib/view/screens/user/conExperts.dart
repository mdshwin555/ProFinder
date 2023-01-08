import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:project2022/main.dart';
import 'package:sizer/sizer.dart';
import '../../../Logic/Api/Controllers/ExpertController.dart';
import '../../../constants/fonts.dart';
import 'package:project2022/constants/colors.dart';
import '../../../constants/images.dart';
import 'package:get/get.dart';
import 'ExpertsDetails.dart';

class ConExperts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color.orange),
        title: Text('${sharedPref?.getString("consulting_name")}'),
      ),
      body: FutureBuilder<dynamic>(
        future: ExpertController.getexperts(),
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
            return GridView.builder(
              itemCount:snapshot.data.length==0?0:snapshot.data[0]['expert'].length,
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

                ],
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Get.to(ExpertsDtails());
                    sharedPref?.setInt("id", snapshot.data[0]['expert'][index]['id']);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.sp),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                          'Platform/public/images/expert/${snapshot.data[0]['expert'][index]['photo']}',

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
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.w,
                                  top: 2.h,
                                ),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 20.sp,
                                ),
                              ),
                              SizedBox(
                                height: 8.5.h,
                              ),
                              Text(
                                '${snapshot.data[0]['expert'][index]['name']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                '${snapshot.data[0]['expert'][index]['address']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
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
          }
           else  {
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
                   Text(
                     'No items yet in this consulting ',
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
    );
  }
}
