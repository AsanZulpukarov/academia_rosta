import 'package:academia_rost/model/entity/student_entity/timetable_entity.dart';
import 'package:academia_rost/theme_this_app.dart';
import 'package:flutter/material.dart';

class TimetableWidget extends StatelessWidget {
  TimetableEntity? timetable;

  Map<int, String>? checkNull;

  TimetableWidget(this.timetable, {Key? key}) : super(key: key);

  String getNameWeekday(int dayNumber) {
    switch (dayNumber) {
      case 1:
        return "Понедельник";
      case 2:
        return "Вторник";
      case 3:
        return "Среда";
      case 4:
        return "Четверг";
      case 5:
        return "Пятница";
      case 6:
        return "Суббота";
      default:
        return "Воскресенье";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: DataTable(
        border: TableBorder.all(
          color: ThemeThisApp.borderColor,
        ),
        columns: [
          DataColumn(
              label: Text(
            'Дни недели',
            style: ThemeThisApp.styleTextHeader,
          )),
          DataColumn(
              label: Text(
            "Время",
            style: ThemeThisApp.styleTextBase,
          ))
        ],
        rows: timetable == null
            ? [
                const DataRow(cells: [
                  DataCell(
                    Text(
                      "Расписание ещё нету",
                    ),
                  ),
                  DataCell(
                    Text(
                      "Расписание ещё нету",
                    ),
                  )
                ]),
              ]
            : getRowTimetable(),
      ),
    );
  }

  List<DataRow> getRowTimetable() {
    return timetable?.checkNullWeekDays?.keys
            .map((e) => DataRow(cells: [
                  DataCell(Text(getNameWeekday(e))),
                  DataCell(Text(timetable?.checkNullWeekDays![e] as String))
                ]))
            .toList() ??
        [
          const DataRow(cells: [
            DataCell(
              Text(
                "Расписание ещё нету",
              ),
            )
          ])
        ];
  }
}
