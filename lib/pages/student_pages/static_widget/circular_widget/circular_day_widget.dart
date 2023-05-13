import 'package:academia_rost/theme_this_app.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../model/entity/student_entity/mark_entites/mark_with_day_entity.dart';

class ShowStaticWithDayWidget extends StatelessWidget {
  MarkWithDayEntity markDay;

  ShowStaticWithDayWidget(this.markDay, {super.key});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Container(
            child: Center(
              child: Text(
                markDay.getCreatedDate(),
                style: ThemeThisApp.styleTextBase,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
      series: <DoughnutSeries>[
        DoughnutSeries<ChartData, String>(
          dataSource: <ChartData>[
            ChartData('Правильно', markDay.correctAnswers ?? 0),
            ChartData('Неправильно', markDay.wrongAnswer ?? 0),
          ],
          pointColorMapper: (ChartData data, _) =>
              data.x == 'Правильно' ? Colors.green : Colors.red,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
          radius: '100%',
          innerRadius: '70%',
        ),
      ],
    );
  }
}

class ChartData {
  final String x;
  final int y;

  ChartData(this.x, this.y);
}
