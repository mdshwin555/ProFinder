import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../../../constants/Api.dart';

class SearchController {
  static Future searchExpert(val) async {
    var response = await http.get(Uri.parse('${Api.searchexperts}/$val'));
    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);

      return urjson;
    }
  }
}
