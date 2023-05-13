import 'package:academia_rost/model/entity/student_entity/mark_entites/mark_with_topic_entity.dart';
import 'package:academia_rost/theme_this_app.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShowStaticWithTopicWidget extends StatelessWidget {
  MarkWithTopicEntity marTopic;

  ShowStaticWithTopicWidget(this.marTopic, {super.key});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Container(
            child: Center(
              child: Text(
                marTopic.topic!,
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
            ChartData('Правильно', marTopic.correctAnswers ?? 0),
            ChartData('Неправильно', marTopic.wrongAnswer ?? 0),
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
