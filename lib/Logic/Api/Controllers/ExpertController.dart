import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project2022/main.dart';
import '../../../constants/Api.dart';
import '../Models/expertmodel.dart';

class ExpertController {


  static Future getexperts() async {
    var response = await http.get(Uri.parse('${Api.viewexperts}/${sharedPref?.getInt("consulting")}'));


    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);

      return urjson;
    }
  }


}
