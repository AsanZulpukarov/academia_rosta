import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/static_variable/static_variable.dart';
import '../../theme_this_app.dart';
import '../../widgets/get_row_text_widget.dart';
import 'calendar.dart';

class StaticScreen extends StatefulWidget {
  const StaticScreen({Key? key}) : super(key: key);

  @override
  State<StaticScreen> createState() => _StaticScreenState();
}

class _StaticScreenState extends State<StaticScreen> {
  CalendarWidget calendar = CalendarWidget();
  List<Widget> monthWeeks = [];

  bool disableButton = false;
  @override
  void initState() {
    calendar = CalendarWidget();
    calendarWidget();
    super.initState();
  }

  Widget _getDayButton(String day) {
    return FloatingActionButton(
      backgroundColor: disableButton
          ? ThemeThisApp.borderColor.withOpacity(0.60)
          : calendar.selectDay.day.toString() == day
              ? ThemeThisApp.fillButton
              : ThemeThisApp.borderColor,
      onPressed: disableButton
          ? null
          : () {
              setState(() {
                calendar.selectDay = DateTime(calendar.selectDay.year,
                    calendar.selectDay.month, int.parse(day));
                monthWeeks.clear();
                calendarWidget();
              });
            },
      child: Text(
        day,
      ),
    );
  }

  Widget _getCircleSizedBoxHeaderText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < CalendarWidget.weekdaysName.length; i++)
          SizedBox(
              width: 38.w,
              child: _getHeaderText(CalendarWidget.weekdaysName.elementAt(i))),
      ],
    );
  }

  Widget _getCircleSizedBoxElevatedButton(int day, int weekday) {
    List<Widget> weekDays = [];
    for (int i = 0; i < CalendarWidget.weekdaysName.length; i++) {
      if ((weekday > i) || (calendar.lastDayOfMonth.day < day + i)) {
        disableButton = true;
      } else {
        disableButton = false;
      }

      weekDays.add(
        SizedBox(
          width: 40.w,
          height: 40.h,
          child: _getDayButton(
              disableButton ? '' : (day + i - weekday).toString()),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: weekDays,
    );
  }

  void calendarWidget() {
    Widget week;
    for (int i = 1; i <= calendar.lastDayOfMonth.day;) {
      if (i == 1) {
        week = _getCircleSizedBoxElevatedButton(
            i, calendar.firstDayOfMonth.weekday - 1);
        i = i - (calendar.firstDayOfMonth.weekday - 1) as int;
      } else {
        week = _getCircleSizedBoxElevatedButton(i, 0);
      }
      i += CalendarWidget.weekdaysName.length;
      monthWeeks.add(week);
    }
  }

  Widget _getHeaderText(String text) {
    return Text(
      text,
      style: ThemeThisApp.styleTextHeader,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.sp),
      children: [
        SizedBox(
          height: 36.h,
          child: _getHeaderText(
              "${CalendarWidget.monthsName.elementAt(calendar.nowDay.month - 1)} - ${calendar.nowDay.year}"),
        ),
        Container(
          // width: 340.w,
          height: 328.h,
          padding: EdgeInsets.all(10.0.sp),
          decoration: ThemeThisApp.borderDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _getCircleSizedBoxHeaderText(),
              for (int i = 0; i < monthWeeks.length; i++)
                monthWeeks.elementAt(i),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30.h,
          child: _getHeaderText(
              '${calendar.selectDay.day}.${calendar.selectDay.month}.${calendar.selectDay.year}'),
        ),
        SizedBox(
          height: 80.h,
          child: FutureBuilder(
              future: null,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      GetRowText.getText('Правильно', '{correct_ans}'),
                      GetRowText.getText('Ошибок', '{total_ques-correct_ans}'),
                      GetRowText.getText('Обших вопросов', '{total_ques}'),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text(StaticVariable.errorFuture));
                }

                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }
}
