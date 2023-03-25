import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyTheme extends StatefulWidget {
  const StudyTheme({Key? key}) : super(key: key);

  @override
  State<StudyTheme> createState() => _StudyThemeState();
}

class _StudyThemeState extends State<StudyTheme> {
  var _PSV = ['ПСВ'];
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

  Widget _widgetExpansionTile() {
    var selectedCountry;
    return DropdownButtonFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.map),
          labelText: 'ПСВ'),
      items: _pomoshDruga.map((country) {
        return DropdownMenuItem(
          value: country,
          child: Text(country),
        );
      }).toList(),
      onChanged: (country) {
        setState(() {
          selectedCountry = country as String;
        });
      },
      value: selectedCountry,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 276.w,
      child: Column(
        children: [
          _widgetExpansionTile(),
          _widgetExpansionTile(),
          _widgetExpansionTile(),
        ],
      ),
    );
  }
}
