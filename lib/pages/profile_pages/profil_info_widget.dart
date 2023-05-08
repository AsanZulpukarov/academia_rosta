import 'package:academia_rost/pages/profile_pages/user_info_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 246.w,
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
              UserInfoFuture(),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
