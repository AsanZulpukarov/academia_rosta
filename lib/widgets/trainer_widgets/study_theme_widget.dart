import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme_this_app.dart';

class StudyTheme extends StatefulWidget {
  StudyTheme({Key? key}) : super(key: key);
  late String selectThemeName;

  @override
  State<StudyTheme> createState() => _StudyThemeState();
}

class _StudyThemeState extends State<StudyTheme> {
  final _psv = ['ПСВ'];
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

  String? psv;
  String? pb;
  String? pd;

  setSelectTheme(String str) {
    widget.selectThemeName = str;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

/*
  Widget _widgetExpansionTile(List<String> theme, String nameTheme) {
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
        onChanged: (select) {
          setState(() {
            selectedTheme = select as String;
          });
        },
        value: selectedTheme,
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButtonFormField(
            iconEnabledColor: ThemeThisApp.fillButton,
            menuMaxHeight: 300.sp,
            borderRadius: ThemeThisApp.borderTextField.borderRadius,
            decoration: InputDecoration(
              labelText: 'Простое Сложение Вычитание',
              labelStyle: ThemeThisApp.styleTextHeader,
              enabledBorder: ThemeThisApp.borderTextField,
              focusedBorder: ThemeThisApp.borderTextField,
              errorBorder: ThemeThisApp.borderTextField,
            ),
            items: _psv.map((theme) {
              return DropdownMenuItem(
                value: theme,
                child: Text(
                  theme,
                  style: ThemeThisApp.styleTextBase,
                ),
              );
            }).toList(),
            onChanged: (select) {
              if (select != null && select != "") {
                setState(() {
                  psv = select;
                  setSelectTheme("psv${psv!}");
                  pb = null;
                  pd = null;
                });
              }
            },
            value: psv,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButtonFormField(
            iconEnabledColor: ThemeThisApp.fillButton,
            menuMaxHeight: 300.sp,
            borderRadius: ThemeThisApp.borderTextField.borderRadius,
            decoration: InputDecoration(
              labelText: "Помощь брата",
              labelStyle: ThemeThisApp.styleTextHeader,
              enabledBorder: ThemeThisApp.borderTextField,
              focusedBorder: ThemeThisApp.borderTextField,
              errorBorder: ThemeThisApp.borderTextField,
            ),
            items: _pomoshBrata.map((theme) {
              return DropdownMenuItem(
                value: theme,
                child: Text(
                  theme,
                  style: ThemeThisApp.styleTextBase,
                ),
              );
            }).toList(),
            onChanged: (select) {
              if (select != null && select != "") {
                setState(() {
                  pb = select;
                  setSelectTheme("pb${pb!}");
                  psv = null;
                  pd = null;
                });
              }
            },
            value: pb,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButtonFormField(
            iconEnabledColor: ThemeThisApp.fillButton,
            menuMaxHeight: 300.sp,
            borderRadius: ThemeThisApp.borderTextField.borderRadius,
            decoration: InputDecoration(
              labelText: "Помощь друга",
              labelStyle: ThemeThisApp.styleTextHeader,
              enabledBorder: ThemeThisApp.borderTextField,
              focusedBorder: ThemeThisApp.borderTextField,
              errorBorder: ThemeThisApp.borderTextField,
            ),
            items: _pomoshDruga.map((theme) {
              return DropdownMenuItem(
                value: theme,
                child: Text(
                  theme,
                  style: ThemeThisApp.styleTextBase,
                ),
              );
            }).toList(),
            onChanged: (select) {
              if (select != null && select != "") {
                setState(() {
                  pd = select;
                  setSelectTheme("pb${pd!}");
                  psv = null;
                  pb = null;
                });
              }
            },
            value: pd,
          ),
        ),
      ]),
    );
  }
}
