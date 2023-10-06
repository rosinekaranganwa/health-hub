import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_hub/widget/indicators_widget.dart';
import 'package:health_hub/widget/pie_chart_section.dart';

class PieChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State<PieChartPage> {
  int touchedIndex = -1; // Initialize with -1 to indicate no section is touched initially

  @override
  Widget build(BuildContext context) => Card(
    child: Column(
      children: <Widget>[
        Expanded(
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
                  setState(() {
                    if (event is FlPanEndEvent || event is FlLongPressEnd) {
                      touchedIndex = -1; // No section is touched
                    }
                    // } else {
                    //   touchedIndex = pieTouchResponse?.touchTooltipData?.sectionIndex ?? -1;
                    // }
                  });
                },
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: getSections(touchedIndex),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: IndicatorsWidget(),
            ),
          ],
        ),
      ],
    ),
  );
}
