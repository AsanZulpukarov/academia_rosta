import 'package:academi_rost/ThemeThisApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimetableStudentScreen extends StatelessWidget {
  const TimetableStudentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> courses = ['Math', 'Fiz', 'Bio', 'Bil'];
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return _getExpansionTile(courses[index]);
        });
  }

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
              getRowText('Учитель:', 'ФИО'),
              getRowText('Группа:', '2группа'),
              getRowText('Расписание:', 'ПН-СР-ПТ 18:00'),
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
