import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:xpenseappstate/app/data/model/transaction_model.dart';
import 'package:xpenseappstate/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:xpenseappstate/app/modules/statistics/views/statistics_view.dart';

class ChartWidget extends StatelessWidget {
  ChartWidget({required this.entiredata, required this.height, Key? key})
      : super(key: key);
  List<TransactionModel> entiredata;
  final double height;

  List<FlSpot> dataset = [];
  List<FlSpot> datasetIncome = [];
  List<FlSpot> yearDataSetExpense = [];
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  final List<Color> gradientColorstwo = [
    const Color.fromARGB(255, 230, 35, 35),
    const Color.fromARGB(255, 211, 2, 2),
  ];

  @override
  Widget build(BuildContext context) {
    final statisticsController = Get.put(StatisticsController());
    if (entiredata.length < 2) {
      return const Center(child: Text('Not enough data'));
    } else {
      return Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          height: height,
          width: 330,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: LineChart(
              LineChartData(
                  titlesData: FlTitlesData(
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                        color: const Color.fromARGB(142, 55, 67, 77), width: 1),
                  ),
                  gridData: FlGridData(
                    show: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: const Color.fromARGB(79, 55, 67, 77),
                        strokeWidth: 1,
                      );
                    },
                    drawVerticalLine: true,
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: const Color.fromARGB(79, 55, 67, 77),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  lineBarsData: [
                    LineChartBarData(
                        isCurved: true,
                        preventCurveOverShooting: true,
                        belowBarData: BarAreaData(
                            show: true,
                            color: statDropDownValue == 'Expense'
                                ? const Color.fromARGB(97, 244, 67, 54)
                                : const Color.fromARGB(91, 76, 175, 79)),
                        gradient: statDropDownValue == 'Expense'
                            ? LinearGradient(colors: gradientColorstwo)
                            : LinearGradient(colors: gradientColors),
                        spots: statDropDownValue == "Expense" && statIndex == 1
                            ? statisticsController
                                .getPlotPointsExpense(entiredata)
                            : statDropDownValue == "Income" && statIndex == 1
                                ? statisticsController.getPlotPoints(entiredata)
                                : statDropDownValue == "Income" &&
                                        statIndex == 2
                                    ? statisticsController
                                        .getYearPlotPointsIncome(entiredata)
                                    : statDropDownValue == "Expense" &&
                                            statIndex == 2
                                        ? statisticsController
                                            .getYearPlotPointsExpense(
                                                entiredata)
                                        : statisticsController
                                            .getPlotPoints(entiredata),
                        barWidth: 5)
                  ]),
            ),
          ));
    }
  }
}
