import 'package:academia_rost/service/api_service/api_client.dart';
import 'package:academia_rost/theme_this_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/entity/user_info.dart';
import '../../../model/static_variable/static_variable.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<UserInfo>?> studentsFuture;
  late List<UserInfo> allStudents = [];
  final _searchStudent = TextEditingController();
  List<UserInfo> _filteredStudent = <UserInfo>[];

  void _searchStudents() {
    final query = _searchStudent.text;
    if (query.isNotEmpty) {
      _filteredStudent = allStudents.where((UserInfo student) {
        return student.lastname!.toLowerCase().contains(query.toLowerCase()) ||
            student.firstname!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredStudent = allStudents;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    studentsFuture = ApiClientHttp().loadAllPupils();
    studentsFuture.then((value) {
      _filteredStudent = value!.toList();
    });
    _searchStudent.addListener(_searchStudents);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 77.h),
          child: FutureBuilder(
              future: studentsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  allStudents = snapshot.data!;
                  return ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: _filteredStudent.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, "/teacher/search_student",
                              arguments: _filteredStudent[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: const EdgeInsets.all(16.0),
                          decoration: ThemeThisApp.borderDecoration,
                          child: Center(
                            child: Text(
                              "${_filteredStudent.elementAt(index).lastname} ${_filteredStudent.elementAt(index).firstname}",
                              style: ThemeThisApp.styleTextBase,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text(StaticVariable.errorFuture),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Поиск студентов',
              labelStyle: ThemeThisApp.styleTextBase,
              hintText: 'Введите имя или фамилию',
              enabledBorder: ThemeThisApp.borderTextField,
              focusedBorder: ThemeThisApp.borderTextField,
              suffixIcon: IconButton(
                iconSize: 20.sp,
                icon: const Icon(
                  Icons.search,
                  color: ThemeThisApp.borderColor,
                ),
                onPressed: _searchStudents,
              ),
            ),
            controller: _searchStudent,
          ),
        ),
      ],
    );
  }
}
