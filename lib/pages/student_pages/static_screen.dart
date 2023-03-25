import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ThemeThisApp.dart';
import '../../widgets/get_row_text_widget.dart';

class StaticScreen extends StatelessWidget {
  StaticScreen({Key? key}) : super(key: key);

  var date = DateTime.now();

  Set<String> weekdaysName = {'ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'};

  Widget _getHeaderText(String t) {
    return Text(
      t,
      style: ThemeThisApp.styleTextHeader,
      textAlign: TextAlign.center,
    );
  }

  Widget _getDayButton(String day) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(CircleBorder()),
          backgroundColor:
              MaterialStatePropertyAll<Color>(ThemeThisApp.borderColor),
        ),
        onPressed: () {},
        child: Text(
          day,
          textAlign: TextAlign.center,
        ));
  }

  Widget _getCircleSizedBoxHeaderText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < weekdaysName.length; i++)
          SizedBox(
              width: 35.w,
              height: 35.h,
              child: _getHeaderText(weekdaysName.elementAt(i))),
      ],
    );
  }

  Widget _getCircleSizedBoxElevatedButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < weekdaysName.length; i++)
          SizedBox(
              width: 40.w,
              height: 40.h,
              child: _getDayButton(weekdaysName.elementAt(i))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _getHeaderText('${date.month} - ${date.year}'),
          Container(
            width: 317.w,
            height: 328.h,
            padding: EdgeInsets.all(16.0.sp),
            decoration: ThemeThisApp.borderDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getCircleSizedBoxHeaderText(),
                _getCircleSizedBoxElevatedButton(),
                _getCircleSizedBoxElevatedButton(),
                _getCircleSizedBoxElevatedButton(),
                _getCircleSizedBoxElevatedButton(),
                _getCircleSizedBoxElevatedButton(),
              ],
            ),
          ),
          _getHeaderText('${date.day}.${date.month}.${date.year}'),
          Column(children: [
            GetRowText.getText('Правильно', '{correct_ans}'),
            GetRowText.getText('Ошибок', '{total_ques-correct_ans}'),
            GetRowText.getText('Обших вопросов', '{total_ques}'),
          ])
        ],
      ),
    );
  }
}
