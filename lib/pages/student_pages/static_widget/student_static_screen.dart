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
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              title: Text(
                "Статистика по дням",
                style: ThemeThisApp.styleTextHeader,
              ),
              maintainState: true,
              iconColor: ThemeThisApp.fillButton,
              collapsedIconColor: ThemeThisApp.fillButton,
              collapsedShape: ThemeThisApp.borderTextField,
              shape: ThemeThisApp.borderTextField,
              children: [
                MarkWithDayFuture(),
              ],
              initiallyExpanded: true,
            ),
            SizedBox(
              height: 30.h,
            ),
            ExpansionTile(
              title: Text(
                "Статистика по темам",
                style: ThemeThisApp.styleTextHeader,
              ),
              maintainState: true,
              iconColor: ThemeThisApp.fillButton,
              collapsedIconColor: ThemeThisApp.fillButton,
              collapsedShape: ThemeThisApp.borderTextField,
              shape: ThemeThisApp.borderTextField,
              children: [
                MarkWithTopicFuture(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
