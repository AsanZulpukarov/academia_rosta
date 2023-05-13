import 'dart:convert';
import 'dart:io';

import 'package:academia_rost/model/entity/student_entity/mark_entites/mark_with_day_entity.dart';
import 'package:academia_rost/model/entity/teacher_entity/group_entity.dart';
import 'package:academia_rost/model/entity/user_auth_entity.dart';

import 'package:http/http.dart' as http;

import '../../model/entity/student_entity/mark_entites/mark_with_topic_entity.dart';
import '../../model/entity/user_info.dart';
import '../../model/static_variable/static_variable.dart';

class ApiClientHttp {
  Future<String> singIn(UserAuthEntity userAuthEntity, bool remember) async {
    String text;
    var client = http.Client();
    var url = Uri.http(StaticVariable.urlIp, '/api/auth/signIn');

    print("${userAuthEntity.username} ${userAuthEntity.password}");
    print(url);
    var response = await client.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userAuthEntity.toJson()));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final parsed = jsonDecode(response.body) as Map<String, dynamic>;
      StaticVariable.userLoginEntity
          .fromJson(parsed, remember, userAuthEntity.username!);
      text = 'Успешно';
    } else if (response.statusCode == 401) {
      text = 'Не правильный логин или пароль';
    } else {
      text = 'Ошибка статуса: ${response.statusCode}.';
    }
    client.close();
    return text;
  }

  Future<UserInfo?> loadUserInfo() async {
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
    print(url);
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
      print(StaticVariable.userLoginEntity.token);
      print(response.statusCode);
      return null;
    }
  }

  Future<List<MarkWithDayEntity>?> loadMarkWithDay() async {
    var client = http.Client();
    var url = Uri.http(StaticVariable.urlIp,
        '/api/mark/${StaticVariable.userLoginEntity.username}');
    print(url);
    var response = await client.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          StaticVariable.userLoginEntity.token ?? "",
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      List<dynamic> markJson = jsonDecode(response.body) as List;
      List<MarkWithDayEntity> mark =
          markJson.map((json) => MarkWithDayEntity.fromJson(json)).toList();
      return mark;
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Future<List<MarkWithTopicEntity>?> loadMarkWithTopic() async {
    var client = http.Client();
    var url = Uri.http(StaticVariable.urlIp,
        '/api/mark/${StaticVariable.userLoginEntity.username}/byTopics');
    var response = await client.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          StaticVariable.userLoginEntity.token ?? "",
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      List<dynamic> markJson = jsonDecode(response.body) as List;
      List<MarkWithTopicEntity> mark =
          markJson.map((json) => MarkWithTopicEntity.fromJson(json)).toList();
      return mark;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
