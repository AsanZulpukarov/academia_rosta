import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({Key? key}) : super(key: key);

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<ExpansionTileWidget> {
  var _PSV = ['ПСВ'];
  var _pomoshBrata = ['+1', '-1', '+2', '-2', '+3', '-3', '+4', '-4'];
  var _pomoshDruga = [
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
  bool _customTileExpanded = false;

  Widget _widgetExpansionTile() {
    var _selectedCountry;
    return DropdownButtonFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.map),
          labelText: 'ПСВ'),
      items: _pomoshDruga.map((country) {
        return DropdownMenuItem(
          child: Text(country),
          value: country,
        );
      }).toList(),
      onChanged: (country) {
        print(country);
        setState(() {
          _selectedCountry = country as String;
          // newUser.country = country;
        });
      },
      value: _selectedCountry,
      // validator: (val) {
      //   return val == null ? 'Please select a country' : null;
      // },
    );
    // return ExpansionTile(
    //   title: Text('Part 1'),
    //   trailing: Icon(
    //     _customTileExpanded
    //         ? Icons.arrow_drop_down_circle
    //         : Icons.arrow_drop_down,
    //   ),
    //   children: [
    //     Row(
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           '${_PSV[0]}',
    //           style: TextStyle(
    //             fontSize: 16.sp,
    //             color: ThemeThisApp.fillButton,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
