import 'dart:convert';

import 'package:academia_rost/model/entity/user_auth_entity.dart';
import 'package:http/http.dart' as http;

import '../../model/static_variable/static_variable.dart';

class AuthApiHttp {
  Future<String> loadData(UserAuthEntity userAuthEntity, bool remember) async {
    String text;
    var client = http.Client();
    var url = Uri.http(StaticVariable.urlIp, '/api/auth/signIn');
    var response = await client.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userAuthEntity.toJson()));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body) as Map<String, dynamic>;
      StaticVariable.userLoginEntity.fromJson(parsed, remember);
      text = 'Успешно';
    } else if (response.statusCode == 401) {
      text = 'Не правильный логин или пароль';
    } else {
      text = 'Request failed with status: ${response.statusCode}.';
    }
    client.close();
    return text;
  }
}
