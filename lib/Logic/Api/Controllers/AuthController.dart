import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:project2022/main.dart';
import '../../../constants/Api.dart';
import 'package:http/http.dart' as http;


class AuthController{


  static Future<String?> login(String email,String password) async {
    var response = await http.post(
        Uri.parse(Api.login),
        body: jsonEncode({
          'email':email,
          'password':password
        }),
        headers: {
          'Content-Type':'application/json',
          'Accept':'application/json',
        }
    );
    Map<String,dynamic> json = jsonDecode(response.body);
    if(response.statusCode == 200) { // json['token'] != null
      await sharedPref?.setString('access_token',json['access_token']);
      return json['access_token'];
    }
  }

  static Future<bool?> register({
    required String name,
    required String email,
    required String password,
    //String? image
  }) async{
    var request = http.MultipartRequest('POST',
        Uri.parse(Api.register));
    request.fields.addAll({
      'email': email,
      'password': password,
      'user_name': name,
    });
    request.headers.addAll({
      'Accept':'application/json'
    });

    var response = await request.send();

    // no need
    if(response.statusCode == 200 ){
      Map<String,dynamic> json = jsonDecode(
          await response.stream.bytesToString()
      );
       //if json['message'] != null;
      //await storage.login(json['token']);
      //await sharedPref?.setString('access_token',json['access_token']);
      return true;
    }


  }

  static Future<bool?> addExpert({
    required String user_name,
    required String email,
    required String password,
    required String name,
    String? image,
    required String phone,
    required String address,
    required String price,
    required String consulting,



  }) async{
    var request = http.MultipartRequest('POST',
        Uri.parse(Api.addExpert));
    request.fields.addAll({
      'user_name': user_name,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'address': address,
      'price': price,
      'consulting': consulting,
    });
    request.headers.addAll({
      'Accept':'application/json'
    });

    if(image != null)
      request.files.add(
          await http.MultipartFile.fromPath(
              'image',
              image)
      );

    var response = await request.send();

    // no need
    if(response.statusCode == 200 ){
      Map<String,dynamic> json = jsonDecode(
          await response.stream.bytesToString()
      );
      //if json['message'] != null;
      //await storage.login(json['token']);
      //await sharedPref?.setString('access_token',json['access_token']);
      return true;
    }


  }

}

