import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme_this_app.dart';

class StudyTheme extends StatefulWidget {
  const StudyTheme({Key? key}) : super(key: key);

  @override
  State<StudyTheme> createState() => _StudyThemeState();
}

class _StudyThemeState extends State<StudyTheme> {
  // ignore: non_constant_identifier_names
  final _PSV = ['ПСВ'];
  final _pomoshBrata = ['+1', '-1', '+2', '-2', '+3', '-3', '+4', '-4'];
  final _pomoshDruga = [
    '+1',
    '-1',
    '+2',
    '-2',
    '+3',
    '-3',
    '+4',
    '-4',
    '+5',
    '-5',
    '+6',
    '-6',
    '+7',
    '-7',
    '+8',
    '-8',
    '+9',
    '-9'
  ];

  Widget _widgetExpansionTile(List<String> theme, String nameTheme) {
    // ignore: prefer_typing_uninitialized_variables
    var selectedTheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField(
        iconEnabledColor: ThemeThisApp.fillButton,
        menuMaxHeight: 300.sp,
        borderRadius: ThemeThisApp.borderTextField.borderRadius,
        decoration: InputDecoration(
          labelText: nameTheme,
          labelStyle: ThemeThisApp.styleTextHeader,
          enabledBorder: ThemeThisApp.borderTextField,
          focusedBorder: ThemeThisApp.borderTextField,
          errorBorder: ThemeThisApp.borderTextField,
          hoverColor: null,
        ),
        items: theme.map((theme) {
          return DropdownMenuItem(
            value: theme,
            child: Text(
              theme,
              style: ThemeThisApp.styleTextBase,
            ),
          );
        }).toList(),
        onChanged: (country) {
          setState(() {
            selectedTheme = country as String;
          });
        },
        value: selectedTheme,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Column(
        children: [
          _widgetExpansionTile(_PSV, 'Простое Сложение Вычитание'),
          _widgetExpansionTile(_pomoshBrata, 'Помощь брата'),
          _widgetExpansionTile(_pomoshDruga, 'Помощь друга'),
        ],
      ),
    );
  }
}
