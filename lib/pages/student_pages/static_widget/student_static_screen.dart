import 'package:academia_rost/theme_this_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'mark_future/mark_with_day_future.dart';
import 'mark_future/mark_with_topic_future.dart';

class StudentStaticScreen extends StatelessWidget {
  const StudentStaticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Статистика день",
              style: ThemeThisApp.styleTextHeader,
            ),
            MarkWithDayFuture(),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Статистика тема",
              style: ThemeThisApp.styleTextHeader,
            ),
            MarkWithTopicFuture(),
          ],
        ),
      ),
    );
  }
}
