import 'package:academi_rost/ThemeThisApp.dart';
import 'package:academi_rost/pages/trener_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    TrenerPage(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 175.w,
          padding: EdgeInsets.all(10.0.sp),
          child: Image.asset(
            'assets/logo/logo_WB.png',
          ),
        ),
        actions: [
          IconButton(
            iconSize: 30.sp,
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40.0.sp,
        backgroundColor: ThemeThisApp.fillButton,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              color: _selectedIndex == 0
                  ? ThemeThisApp.borderColor
                  : ThemeThisApp.textInButtonColor,
            ),
            label: 'Расписание',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate,
              color: _selectedIndex == 1
                  ? ThemeThisApp.borderColor
                  : ThemeThisApp.textInButtonColor,
            ),
            label: 'Тренировка',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.query_stats,
              color: _selectedIndex == 2
                  ? ThemeThisApp.borderColor
                  : ThemeThisApp.textInButtonColor,
            ),
            label: 'Статистика',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ThemeThisApp.borderColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
