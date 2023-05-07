import 'package:academia_rost/theme_this_app.dart';
import 'package:academia_rost/widgets/trainer_widgets/random_val_character_and_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/trainer_service.dart';

class ShowRandomValWidget extends StatefulWidget {
  ShowRandomValWidget({Key? key}) : super(key: key);
  TrainerService trainerService = TrainerService();
  RandomValCharacterAndTheme characterAndTheme = RandomValCharacterAndTheme();
  late List<int> output;
  getRandomArray() {
    output = trainerService.getArray('psv', 2, 5);
  }

  @override
  State<ShowRandomValWidget> createState() => ShowRandomValWidgetState();
}

class ShowRandomValWidgetState extends State<ShowRandomValWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112.w,
      height: 133.h,
      child: Column(
        children: [
          Container(
              width: 112.w,
              height: 90.h,
              alignment: Alignment.center,
              child: Text(
                "Random",
                style: ThemeThisApp.styleTextHeader,
              )),
          SizedBox(
            width: 112.w,
            height: 42.h,
            child: TextField(
              style: ThemeThisApp.styleTextBase,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Ответ',
                  labelStyle: ThemeThisApp.styleTextBase,
                  enabledBorder: ThemeThisApp.borderTextField,
                  focusedBorder: ThemeThisApp.borderTextField),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ],
      ),
    );
  }
}
