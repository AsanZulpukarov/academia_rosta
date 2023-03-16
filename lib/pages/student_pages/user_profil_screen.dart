import 'package:academi_rost/ThemeThisApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentProfileScreen extends StatelessWidget {
  final Map<String, String> _userInfo = {
    'ФИО:': '{user.lastName} {user.firstName} {user.fatherName}',
    'Возраст:': '{user.age}',
    'Логин:': '{user.userLoginPassword.userName}',
    'Номер тел:': '{user.phone_number}',
    'Адрес:': '{user.address}',
  };

  StudentProfileScreen({super.key});

  Row getRowText(String text1, String text2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text1,
            style: ThemeThisApp.styleTextHeader,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            text2,
            style: ThemeThisApp.styleTextBase,
          ),
        ),
      ],
    );
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
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Назад', style: ThemeThisApp.styleTextButton))
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
                    return getRowText(entry.key, entry.value);
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
                  onPressed: () {},
                  child: const Text(
                    "Выйти",
                    style: ThemeThisApp.styleTextButton,
                  )),
            ],
          ),
        ));
  }
}
