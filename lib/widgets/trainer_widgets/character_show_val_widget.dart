import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme_this_app.dart';

class CharacterShowValWidget extends StatefulWidget {
  const CharacterShowValWidget({Key? key}) : super(key: key);

  @override
  State<CharacterShowValWidget> createState() => CharacterShowValWidgetState();
}

class CharacterShowValWidgetState extends State<CharacterShowValWidget> {
  final Map<String, double> _characterTrainer = {
    "Скорость": 1.00,
    "Разрядность": 1.00,
    "Количество переменных": 1.00
  };
  Widget _rowTextAndIcon(String text, double num) {
    var iconSize = 18.sp;
    return SizedBox(
      width: 276.w,
      height: 32.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: ThemeThisApp.fillButton),
            ),
          ),
          Row(
            children: [
              IconButton(
                iconSize: iconSize,
                tooltip: 'Уменьшить',
                onPressed: () {
                  if (_characterTrainer[text]! - num < 0.2) return;
                  setState(() {
                    _characterTrainer[text] = _characterTrainer[text]! - num;
                  });
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: ThemeThisApp.borderColor,
                ),
                splashRadius: 12.r,
              ),
              Container(
                width: 26.w,
                alignment: Alignment.center,
                child: Text(
                  text == 'Скорость'
                      ? _characterTrainer[text]!.toStringAsFixed(2)
                      : _characterTrainer[text]!.toStringAsFixed(0),
                  style: const TextStyle(color: ThemeThisApp.fillButton),
                ),
              ),
              IconButton(
                iconSize: iconSize,
                tooltip: 'Увеличить',
                splashRadius: 12.r,
                onPressed: () {
                  setState(() {
                    _characterTrainer[text] = _characterTrainer[text]! + num;
                  });
                },
                icon: const Icon(
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
    return Column(
      children: [
        SizedBox(
          width: 276.w,
          child: Column(
              children: _characterTrainer.entries.map((entry) {
            return _rowTextAndIcon(
                entry.key, entry.key == "Скорость" ? 0.20 : 1);
          }).toList()),
        ),
      ],
    );
  }
}
