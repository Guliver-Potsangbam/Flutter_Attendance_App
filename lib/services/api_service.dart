import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:attendance/models/user_model.dart';

class ApiService {
  String url =
      "https://script.google.com/macros/s/AKfycbz7CLVQLHuf8TBqplka52h84guRfkLIbn4c-UVVV2JrrqwGGXc_vHwSDxW4-aPJ3bK_/exec";
  Future<List<UserModel>> fetchData() async {
    var response = await http.get(Uri.parse(url));

    //to get the list<dynamic> response
    List<dynamic> jsonData = [];

    if (response.statusCode == 200) {
      //print(response.body);

      jsonData = jsonDecode(response.body);
    }

    List<UserModel> users = [];

    users = jsonData.map((e) => UserModel.fromJson(e)).toList();

    print(users.runtimeType);
    //log(users[0].name);

    // ignore: avoid_print
    users.map((e) => print(e.name)).toList();

    return users;
  }
}
