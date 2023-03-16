import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ThemeThisApp.dart';

class CharacterShowValWidget extends StatefulWidget {
  const CharacterShowValWidget({Key? key}) : super(key: key);

  @override
  State<CharacterShowValWidget> createState() => CharacterShowValWidgetState();
}

class CharacterShowValWidgetState extends State<CharacterShowValWidget> {
  Map<String, double> _characterTrainer = {
    "Скорость": 1.00,
    "Разрядность": 1.00,
    "Количество переменных": 1.00
  };
  Widget _rowTextAndIcon(String text, double num) {
    var icon_size = 18.sp;
    return Container(
      width: 276.w,
      height: 32.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: ThemeThisApp.fillButton),
            ),
          ),
          Row(
            children: [
              IconButton(
                iconSize: icon_size,
                tooltip: 'Уменьшить',
                onPressed: () {
                  setState(() {
                    num -= 1.00;
                  });
                },
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: ThemeThisApp.borderColor,
                ),
                splashRadius: 12.r,
              ),
              Container(
                width: 26.w,
                alignment: Alignment.center,
                child: Text(
                  "${num}",
                  style: TextStyle(color: ThemeThisApp.fillButton),
                ),
              ),
              IconButton(
                iconSize: icon_size,
                tooltip: 'Увеличить',
                splashRadius: 12.r,
                onPressed: () {
                  setState(() {
                    num += 1.00;
                  });
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: ThemeThisApp.borderColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 276.w,
            child: Column(
                children: _characterTrainer.entries.map((entry) {
              return _rowTextAndIcon(entry.key, entry.value);
            }).toList()),
          ),
        ],
      ),
    );
  }
}
