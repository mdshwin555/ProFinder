import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2022/view/screens/user/ExpertDetails.dart';
import 'package:project2022/view/screens/user/Home.dart';
import 'package:project2022/view/screens/Splash.dart';
import 'package:project2022/view/screens/auth/Login.dart';
import 'package:project2022/view/screens/auth/Register.dart';
import 'package:project2022/view/screens/auth/Type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'Services/HomeMiddleWare.dart';
import 'Services/LoginMiddleWare.dart';
import 'constants/routes.dart';

SharedPreferences? sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  sharedPref?.clear();                    // DON'T FORGET REMOVE IT 😒
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext, Orientation, DeviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: Routes.typeScreen,
            page: () => Type(),
            middlewares: [
              LoginMiddleWare(),
            ],
          ),
          GetPage(
            name: Routes.Login,
            page: () => Login(),
            middlewares: [
              HomeMiddleWare(),
            ],
          ),
          GetPage(name: Routes.Register, page: () => Register()),
          GetPage(name: Routes.Home, page: () => Home()),
          GetPage(name: Routes.SplashScreen, page: () => SplachScreen()),
          //GetPage(name: Routes.expertDetails, page: () => ExpertDetails()),
        ],
        initialRoute: Routes.SplashScreen,
      ),
    );
  }
}
