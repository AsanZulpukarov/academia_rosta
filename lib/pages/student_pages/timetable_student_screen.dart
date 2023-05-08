import 'package:academia_rost/theme_this_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/static_variable/static_variable.dart';
import '../../widgets/get_row_text_widget.dart';

class TimetableStudentScreen extends StatelessWidget {
  const TimetableStudentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> courses = ['Math', 'Fiz', 'Bio', 'Bil'];
    return FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return _getExpansionTile(courses[index]);
                });
          } else if (snapshot.hasError) {
            return const Center(child: Text(StaticVariable.errorFuture));
          }

          return const Center(child: CircularProgressIndicator());
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
              GetRowText.getText('Учитель:', 'ФИО'),
              GetRowText.getText('Группа:', '2группа'),
              GetRowText.getText('Расписание:', 'ПН-СР-ПТ 18:00'),
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
