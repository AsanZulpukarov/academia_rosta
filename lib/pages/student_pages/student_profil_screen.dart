import 'package:academia_rost/theme_this_app.dart';
import 'package:academia_rost/model/entity/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/get_row_text_widget.dart';

class StudentProfileScreen extends StatelessWidget {
  final UserInfo user;
  late final Map<String, String> _userInfo;
  StudentProfileScreen({super.key, required this.user}) {
    _userInfo = {
      'ФИО:': '${user.lastname} ${user.firstname}',
      'Возраст:': '${user.age}',
      'Логин:': '${user.username}',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: 175,
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
      body: ListView(
        children: [
          SizedBox(
            height: 70.h,
          ),
          Container(
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
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/auth', (Route<dynamic> route) => false);
                    },
                    child: const Text(
                      "Выйти",
                      style: ThemeThisApp.styleTextButton,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
