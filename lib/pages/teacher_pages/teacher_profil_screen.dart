import 'package:academi_rost/ThemeThisApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/get_row_text_widget.dart';

class TeacherProfileScreen extends StatelessWidget {
  final Map<String, String> _userInfo = {
    'ФИО:': '{user.lastName} {user.firstName} {user.fatherName}',
    'Возраст:': '{user.age}',
    'Логин:': '{user.userLoginPassword.userName}',
    'Номер тел:': '{user.phone_number}',
    'Дата поступления на работу': '{user.enrollmentDate}',
    'Адрес:': '{user.address}',
  };

  TeacherProfileScreen({super.key});

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
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Назад',
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: ThemeThisApp.textInButtonColor),
                ))
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150.w,
                height: 150.h,
                child: Image.asset(
                  'assets/splash_screen_image.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  children: _userInfo.entries.map((entry) {
                    return GetRowText.getText(entry.key, entry.value);
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        ThemeThisApp.fillButton),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/auth');
                  },
                  child: const Text(
                    "Выйти",
                    style: ThemeThisApp.styleTextButton,
                  )),
            ],
          ),
        ));
  }
}
