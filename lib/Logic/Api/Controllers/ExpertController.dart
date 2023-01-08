import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:project2022/main.dart';
import '../../../constants/Api.dart';

class ExpertController {


  static Future getexperts() async {
    var response = await http.get(Uri.parse('${Api.viewexperts}/${sharedPref?.getInt("consulting")}'),
        headers: {
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    }
    );

    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);

      return urjson;
    }
  }

  static Future getexpert() async {
    var response = await http.get(Uri.parse('${Api.viewexpert}/${sharedPref?.getInt("id")}'),
        headers: {
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    }
    );
    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);
      return urjson;
    }
  }

  static Future showfav() async {
    var response = await http.get(Uri.parse('${Api.showfav}?user_id=2&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9sb2dpbiIsImlhdCI6MTY3MzA1MjIwOCwiZXhwIjoxNjczMDU1ODA4LCJuYmYiOjE2NzMwNTIyMDgsImp0aSI6IjExZHBBU0l3TkpnVzdnNUIiLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.y0dl3bfzAPjyUnqar4LdvW8FyzTRkbbtZmwI7t2b7Mk'),
        headers: {
          "Connection": "Keep-Alive",
          "Keep-Alive": "timeout=5, max=1000"
        }
    );
    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);
      return urjson;
    }
  }


  static Future<bool?> addtofav({
    required String expert_name,
    required String user_id,
    required String token,


    //String? image
  }) async{
    var request = http.MultipartRequest('POST',
        Uri.parse(Api.addtofav));
    request.fields.addAll({
      'expert_name': expert_name,
      'user_id': user_id,
      'token': token,

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

      return true;
    }


  }

  static Future<bool?> addrate({
    required String rate,
    required String expert_id,

  }) async{
    var request = http.MultipartRequest('POST',
        Uri.parse('${Api.addrate}/${sharedPref?.getInt("id")}'));
    request.fields.addAll({
      'rate': rate,
      'expert_id': expert_id,
    });
    request.headers.addAll({
      'Accept':'application/json'
    });

    var response = await request.send();

    if(response.statusCode == 200 ){
      Map<String,dynamic> json = jsonDecode(
          await response.stream.bytesToString()
      );

      return true;
    }


  }

  static Future viewavg() async {
    var response = await http.get(Uri.parse('${Api.viewavg}/${sharedPref?.getInt("id")}'),
        headers: {
          "Connection": "Keep-Alive",
          "Keep-Alive": "timeout=5, max=1000"
        }
    );
    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);
      return urjson;
    }
  }

  static Future viewTime() async {
    var response = await http.get(Uri.parse('${Api.viewTime}/${sharedPref?.getInt("id")}'),
        headers: {
          "Connection": "Keep-Alive",
          "Keep-Alive": "timeout=5, max=1000"
        }
    );
    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);
      return urjson;
    }
  }

  static Future<String?> reserveTime({
    required String token,

  }) async{
    var request = http.MultipartRequest('POST',
        Uri.parse('${Api.reserveTime}/${sharedPref?.getInt("time_id")}'));
    request.fields.addAll({
      'token': token,
    });
    request.headers.addAll({
      'Accept':'application/json'
    });

    var response = await request.send();

    if(response.statusCode == 200 ){
      Map<String,dynamic> json = jsonDecode(
          await response.stream.bytesToString()
      );

      return json['message'];
    }


  }

}
