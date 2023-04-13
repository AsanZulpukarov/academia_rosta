import 'dart:convert';

import 'package:academia_rost/model/entity/user_request_model.dart';
import 'package:http/http.dart' as http;

import '../model/static_variable/static_variable.dart';

class AuthApiHttp {
  late String text;
  Future<void> loadData(
      UserRequestModel userRequestModel, bool remember) async {
    var client = http.Client();
    var url = Uri.http(StaticVariable.urlIp, '/api/auth/signIn');
    var response = await client.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userRequestModel..toJson()));
    if (response.statusCode == 200) {
      text = 'Успешно';
      final parsed = jsonDecode(response.body) as Map<String, dynamic>;
      StaticVariable.userResponseModel.fromJson(parsed);
      StaticVariable.userResponseModel.register = remember;
    } else if (response.statusCode == 401) {
      text = 'Не правильный логин или пароль';
    } else {
      text = 'Request failed with status: ${response.statusCode}.';
    }
  }
}
