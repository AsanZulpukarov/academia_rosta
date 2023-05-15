import 'package:academia_rost/pages/profile_pages/profil_info_widget.dart';
import 'package:academia_rost/theme_this_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/entity/user_info.dart';
import '../../model/static_variable/static_variable.dart';

class ProfileScreen extends StatelessWidget {
  bool isSelectUser = true;
  UserInfo? user;
  ProfileScreen({super.key, user});

  ProfileScreen.selectStudent(this.isSelectUser, this.user, {super.key});

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
            child: const Text(
              'Назад',
              style: ThemeThisApp.styleTextButton,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 70.h,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ProfileInfoWidget.selectStudent(
              isSelectUser,
              user,
            ),
          ),
          isSelectUser
              ? SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: Center(
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              ThemeThisApp.fillButton),
                        ),
                        onPressed: () {
                          StaticVariable.userLoginEntity.deleteAllData();
                          Navigator.pushNamedAndRemoveUntil(context, '/auth',
                              (Route<dynamic> route) => false);
                        },
                        child: const Text(
                          "Выйти",
                          style: ThemeThisApp.styleTextButton,
                        )),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
