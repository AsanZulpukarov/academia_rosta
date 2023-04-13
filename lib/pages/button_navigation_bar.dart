import 'dart:convert';
import 'dart:io';

import 'package:academia_rost/model/entity/user_info.dart';
import 'package:academia_rost/model/static_variable/static_variable.dart';
import 'package:academia_rost/pages/student_pages/static_screen.dart';
import 'package:academia_rost/pages/student_pages/timetable_student_screen.dart';
import 'package:academia_rost/pages/teacher_pages/groups_pages.dart';
import 'package:academia_rost/pages/teacher_pages/search_page.dart';
import 'package:academia_rost/pages/trainer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/enum/role_user_enum.dart';

import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> studentPage = const [
    TimetableStudentScreen(),
    TrainerPage(),
    StaticScreen()
  ];
  List<Widget> teacherPage = const [
    GroupsPages(),
    TrainerPage(),
    SearchPage(),
  ];
  int _selectedIndex = 1;
  bool role = StaticVariable.userResponseModel.roleUser == RoleUser.student;

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    loadUserDate();
    super.initState();
  }

  UserInfo? userInfo;

  Future<void> loadUserDate() async {
    var client = http.Client();
    var url = Uri.http(StaticVariable.urlIp, '/api/user/');
    var response = await client.get(url, headers: <String, String>{
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader:
          StaticVariable.userResponseModel.token as String,
    });
    if (response.statusCode == 200) {
      print(response.body);
      parseUserBody(response.body);
      // parseUserBody(response.body);
      // Navigator.pushReplacementNamed(context, '/main_page');
    } else if (response.statusCode == 401) {
      print('error + ${response.statusCode}');
      // _showMessage(message: 'Не правильный логин или пароль');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void parseUserBody(String responseBody) {
    final parsed = jsonDecode(responseBody) as Map<String, dynamic>;
    userInfo = UserInfo.fromJson(parsed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 175,
          padding: EdgeInsets.all(10.0.sp),
          child: Image.asset(
            'assets/logo/logo_WB.png',
          ),
        ),
        actions: [
          IconButton(
            iconSize: 30.sp,
            onPressed: () {
              role
                  ? Navigator.pushNamed(context, '/student_profile',
                      arguments: userInfo)
                  : Navigator.pushNamed(context, '/teacher_profile',
                      arguments: userInfo);
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
          // index: _selectedIndex,
          child: role
              ? studentPage.elementAt(_selectedIndex)
              : teacherPage.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0.sp,
        items: role
            ? const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_month,
                  ),
                  label: 'Расписание',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calculate,
                  ),
                  label: 'Тренировка',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.query_stats,
                  ),
                  label: 'Статистика',
                ),
              ]
            : const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people,
                  ),
                  label: 'Группа',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calculate,
                  ),
                  label: 'Тренировка',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Поиск студента',
                ),
              ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
