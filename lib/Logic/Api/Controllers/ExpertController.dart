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
     // print(index);
      // for (var j in urjson)
      //  {
      //    var urjson2 =json.decode(response.body);
      //    for (var jj in urjson2)
      //    {
      //      ulist.add(expertmodel.fromJson(jj));
      //
      //    }
      //  }
      return urjson;
    }
  }

// static Future<List<expertmodel>> getMyexperts(id) async{
//   var response = await http.get(
//       Uri.parse(Api.viewexperts),
//       headers: {
//         'Accept':'application/json',
//         'Authorization': 'Bearer ${storage.token}'
//       }
//   );
//   if(response.statusCode != 200)
//     return [];
//   Map<String,dynamic> json = jsonDecode(response.body);
//   log(json['url'].toString());
//   List<PostModel> posts = [];
//   for(var p in json['posts'])
//     posts.add(
//         PostModel.fromJson(p)
//     );
//
//   print(posts);
//
//   return posts;
// }

}
