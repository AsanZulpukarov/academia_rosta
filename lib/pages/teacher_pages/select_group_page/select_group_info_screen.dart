import 'package:academia_rost/model/entity/teacher_entity/group_entity.dart';
import 'package:academia_rost/pages/teacher_pages/select_group_page/timetable_widget.dart';
import 'package:academia_rost/theme_this_app.dart';
import 'package:academia_rost/widgets/get_row_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectGroupInfoScreen extends StatelessWidget {
  GroupEntity groupEntity;
  SelectGroupInfoScreen(this.groupEntity, {Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                      child: Text(
                        "${groupEntity.name}",
                        style: ThemeThisApp.styleTextHeader,
                      ),
                    ),
                    GetRowText.getText("Сабак", "${groupEntity.subject?.name}"),
                    GetRowText.getText("Мугалим",
                        "${groupEntity.teacher?.lastname} ${groupEntity.teacher?.firstname}"),
                  ],
                ),
              ),
            ),
            TimetableWidget(groupEntity.timetable),
          ],
        ),
      ),
    );
  }
}
