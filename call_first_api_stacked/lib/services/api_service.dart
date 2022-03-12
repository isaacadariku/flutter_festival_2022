import 'dart:developer';

import 'package:call_first_api_stacked/constants.dart';
import 'package:call_first_api_stacked/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return userModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
