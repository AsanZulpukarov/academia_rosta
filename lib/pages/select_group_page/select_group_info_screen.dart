import 'package:academia_rost/model/entity/teacher_entity/group_entity.dart';
import 'package:academia_rost/pages/select_group_page/timetable_widget.dart';
import 'package:academia_rost/theme_this_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/get_row_widget.dart';
import 'group_student_future.dart';

class SelectGroupInfoScreen extends StatelessWidget {
  GroupEntity? groupEntity;
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 40.h,
                      child: Text(
                        "${groupEntity?.name}",
                        style: ThemeThisApp.styleTextHeader,
                      ),
                    ),
                    GetRow.getText("Сабак", "${groupEntity?.subject?.name}"),
                    GetRow.getText("Мугалим",
                        "${groupEntity?.teacher?.lastname} ${groupEntity?.teacher?.firstname}"),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TimetableWidget(groupEntity?.timetable),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  "Ученики группы",
                  style: ThemeThisApp.styleTextHeader,
                ),
              ),
              SizedBox(
                  height: 200.h,
                  width: 320.w,
                  child: GroupStudentsFuture(groupEntity?.id)),
            ],
          ),
        ),
      ),
    );
  }
}
