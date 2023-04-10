import 'dart:convert';

import 'package:academi_rost/model/entity/user_entity_json.dart';
import 'package:academi_rost/model/entity/user_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/static_variable/StaticVariable.dart';

class AuthApiHttp {
  Future<String> loadData(
      UserRequestModel userRequestModel, bool remember) async {
    var client = http.Client();
    var url = Uri.http(StaticVariable.urlIp, '/api/auth/signIn');
    var response = await client.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userRequestModel..toJson()));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body) as Map<String, dynamic>;
      StaticVariable.userResponseModel?.fromJson(parsed);
      StaticVariable.userResponseModel?.register = remember;
      return 'Успешно';
    } else if (response.statusCode == 401) {
      return 'Не правильный логин или пароль';
    } else {
      return 'Request failed with status: ${response.statusCode}.';
    }
  }
}
