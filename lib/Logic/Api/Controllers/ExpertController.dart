import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/expertmodel.dart';

class ExpertController {
  static Future<List<expertmodel>> getexperts(id) async {
    var response = await http
        .get(Uri.parse("http://10.0.2.2:8000/api/viewexperts/$id"));
    Map<String, dynamic> json = jsonDecode(response.body);
    List<expertmodel> models = [];
    for (var j in json['']) models.add(expertmodel.fromJson(j));
    return models;
  }

}