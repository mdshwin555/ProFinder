import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/expertmodel.dart';

class ExpertController {
  static Future<List<expertmodel>> getexperts(id) async {

    var response = await http
        .get(Uri.parse("http://10.0.2.2:8000/api/viewexperts/$id"));

    List<expertmodel> ulist=[];

    if(response.statusCode == 200){
      var urjson=json.decode(response.body);
      for (var j in urjson)
       for (var jj in urjson)
       {
         ulist.add(expertmodel.fromJson(jj));
       }
    }



    return ulist;
  }

}