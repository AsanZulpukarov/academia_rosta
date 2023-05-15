import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme_this_app.dart';

class GetRow {
  static Row getText(String text1, String text2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text1,
            style: ThemeThisApp.styleTextHeader,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            text2,
            style: ThemeThisApp.styleTextBase,
          ),
        ),
      ],
    );
  }

  static Row getCorrectAndWrongInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListTile(
            title: Text(
              "Правильно",
              style: TextStyle(color: Colors.green, fontSize: 12.sp),
            ),
            leading: Icon(
              Icons.done_all,
              color: Colors.green,
              size: 24.sp,
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              "Неправильно",
              style: TextStyle(color: Colors.red, fontSize: 12.sp),
            ),
            leading: Icon(
              Icons.close,
              color: Colors.red,
              size: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
