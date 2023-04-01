import 'package:academi_rost/pages/student_pages/timetable_student_screen.dart';
import 'package:academi_rost/pages/teacher_pages/search_page.dart';
import 'package:academi_rost/pages/trainer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
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
              Navigator.pushNamed(context, '/user_profile');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          TimetableStudentScreen(),
          TrainerPage(),
          SearchPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0.sp,
        items: const <BottomNavigationBarItem>[
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
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
