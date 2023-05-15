import 'package:academia_rost/service/api_service/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/entity/user_info.dart';
import '../../model/static_variable/static_variable.dart';
import '../../theme_this_app.dart';

class GroupStudentsFuture extends StatefulWidget {
  int? id;

  GroupStudentsFuture(this.id, {Key? key}) : super(key: key);

  @override
  State<GroupStudentsFuture> createState() => _GroupStudentsFutureState();
}

class _GroupStudentsFutureState extends State<GroupStudentsFuture> {
  late Future<List<UserInfo?>?> students;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    students = ApiClientHttp().loadGroupStudents(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: students,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/teacher/search_student",
                        arguments: snapshot.data?[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(16.0),
                    decoration: ThemeThisApp.borderDecoration,
                    child: Center(
                      child: Text(
                        "${snapshot.data?.elementAt(index)?.lastname} ${snapshot.data?.elementAt(index)?.firstname}",
                        style: ThemeThisApp.styleTextBase,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return SizedBox(
              height: 60.h,
              child: const Center(
                child: Text(StaticVariable.errorFuture),
              ),
            );
          }
          return SizedBox(
              height: 60.h,
              child: const Center(child: CircularProgressIndicator()));
        });
  }
}
