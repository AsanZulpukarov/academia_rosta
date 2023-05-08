import 'package:academia_rost/model/entity/user_info.dart';
import 'package:academia_rost/model/static_variable/static_variable.dart';
import 'package:academia_rost/pages/student_pages/static_screen.dart';
import 'package:academia_rost/pages/student_pages/timetable_student_screen.dart';
import 'package:academia_rost/pages/teacher_pages/my_groups/groups_screen.dart';
import 'package:academia_rost/pages/teacher_pages/search_page.dart';
import 'package:academia_rost/pages/trainer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/enum/role_user_enum.dart';

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
  List<Widget> teacherPage = [
    GroupsScreen(),
    TrainerPage(),
    SearchPage(),
  ];
  int _selectedIndex = 1;
  bool role = StaticVariable.userLoginEntity.roleUser ==
          StaticVariable.roleUser[RoleUser.student]
      ? true
      : false;
  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  UserInfo? userInfo;
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
              Navigator.pushNamed(context, '/user_profile_info');
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
