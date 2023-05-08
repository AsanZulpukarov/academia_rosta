import 'dart:convert';
import 'dart:io';

import 'package:academia_rost/model/entity/teacher_entity/group_entity.dart';
import 'package:academia_rost/model/entity/user_auth_entity.dart';

import 'package:http/http.dart' as http;

import '../../model/entity/user_info.dart';
import '../../model/static_variable/static_variable.dart';

class ApiUserHttp {

  Future<String> singIn(UserAuthEntity userAuthEntity, bool remember) async {
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

  Future<UserInfo> loadUserInfo() async {
    var client = http.Client();
    var url = Uri.http(StaticVariable.urlIp, '/api/user/');
    var response = await client.get(url, headers: <String, String>{
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader:
          StaticVariable.userLoginEntity.token ?? "",
    });
    if (response.statusCode == 200) {
      print(response.body);
      return UserInfo.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      return UserInfo();
    }
  }

  Future<List<GroupEntity>?> loadTeacherGroups() async {
    var client = http.Client();
    var url = Uri.http(StaticVariable.urlIp, '/api/group/');
    var response = await client.get(url, headers: <String, String>{
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader:
          StaticVariable.userLoginEntity.token ?? "",
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      List<dynamic> myGroups = jsonDecode(response.body) as List;
      List<GroupEntity> mygr =
          myGroups.map((json) => GroupEntity.fromJson(json)).toList();
      return mygr;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
