import 'package:academia_rost/theme_this_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Student {
  late String name;
  late int age;

  Student(this.name, this.age);
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Student> students = [];
  var _filteredStudent = <Student>[];
  final _searchStudent = TextEditingController();

  void _searchStudents() {
    final query = _searchStudent.text;
    if (query.isNotEmpty) {
      _filteredStudent = students.where((Student student) {
        return student.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredStudent = students;
    }
    setState(() {});
  }

  @override
  void initState() {
    for (int i = 0; i < 7; i++) {
      students.add(Student('$i', i));
    }

    _filteredStudent = students;
    _searchStudent.addListener(_searchStudents);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(top: 77.h),
          itemCount: _filteredStudent.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: ThemeThisApp.borderDecoration,
              child: Column(
                children: [
                  Text(_filteredStudent.elementAt(index).name),
                  Text('${_filteredStudent.elementAt(index).age}'),
                ],
              ),
            );
          },
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
        )
      ],
    );
  }
}
