import 'package:academi_rost/ThemeThisApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/get_row_text_widget.dart';

class GroupsPages extends StatelessWidget {
  const GroupsPages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> courses = ['1-group', '2-group', '3-group', '4-group'];
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return _getExpansionTile(courses[index]);
        });
  }

  Widget _getExpansionTile(String nameCourse) {
    return Column(
      children: [
        Container(
          width: 340.w,
          decoration: ThemeThisApp.borderDecoration,
          child: ExpansionTile(
            maintainState: false,
            childrenPadding: const EdgeInsets.all(12.0),
            title: Text(
              nameCourse,
              style: ThemeThisApp.styleTextHeader,
            ),
            children: [
              GetRowText.getText('Ученик:', 'ФИО'),
              GetRowText.getText('Ученик:', 'ФИО'),
              GetRowText.getText('Ученик:', 'ФИО'),
              GetRowText.getText('Ученик:', 'ФИО'),
              GetRowText.getText('Ученик:', 'ФИО'),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
