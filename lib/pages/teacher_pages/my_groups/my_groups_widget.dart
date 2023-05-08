import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/entity/teacher_entity/group_entity.dart';
import '../../../theme_this_app.dart';
import '../../../widgets/get_row_text_widget.dart';

class MyGroupsWidget extends StatelessWidget {
  List<GroupEntity>? courses;
  MyGroupsWidget({Key? key, required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: courses?.length,
        itemBuilder: (context, index) {
          return _getExpansionTile(courses?.elementAt(index), index);
        });
  }

  Widget _getExpansionTile(GroupEntity? nameCourse, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 300.w,
        decoration: ThemeThisApp.borderDecoration,
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.people,
                  color: ThemeThisApp.borderColor,
                ),
                TextButton(onPressed: () {}, child: Text("Name")),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            GetRowText.getText("Мугалим", "name"),
            SizedBox(
              height: 10.h,
            ),
            GetRowText.getText("Окуучулардын саны", index.toString()),
          ],
        ),
      ),
    );
  }
}
