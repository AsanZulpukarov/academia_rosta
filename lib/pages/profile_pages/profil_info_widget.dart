import 'package:academia_rost/pages/profile_pages/student_info_widget.dart';
import 'package:academia_rost/pages/profile_pages/user_info_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/entity/user_info.dart';

class ProfileInfoWidget extends StatelessWidget {
  bool isUser = true;
  UserInfo? user;
  ProfileInfoWidget({super.key, user});

  ProfileInfoWidget.selectStudent(this.isUser, this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 246.w,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            isUser ? UserInfoFuture() : StudentInfoWidget(user),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
