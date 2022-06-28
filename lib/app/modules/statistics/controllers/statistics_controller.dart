import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:xpenseappstate/app/data/controller/data_controller.dart';
import 'package:xpenseappstate/app/data/model/transaction_model.dart';
import 'package:xpenseappstate/app/modules/statistics/views/statistics_view.dart';
import 'package:xpenseappstate/app/modules/statistics/views/widget/chart_widget.dart';

class StatisticsController extends GetxController {
  List<FlSpot> getPlotPoints(List<TransactionModel> entireData) {
    final dataController = Get.put(DataController());
    ChartWidget chart = ChartWidget(
        entiredata: dataController.transactionDataList, height: 300);
    List tempDataSetIncome = [];
    final today = DateTime.now();

    for (TransactionModel data in entireData) {
      if (data.date.month == today.month && data.type == "Income") {
        tempDataSetIncome.add(data);
      }
    }

    tempDataSetIncome.sort((a, b) => a.date.day.compareTo(b.date.day));
    for (var i = 0; i < tempDataSetIncome.length; i++) {
      chart.datasetIncome.add(FlSpot(tempDataSetIncome[i].date.day.toDouble(),
          tempDataSetIncome[i].amount.toDouble()));
    }
    return chart.datasetIncome;
  }

  List<FlSpot> getPlotPointsExpense(List<TransactionModel> entireData) {
    final dataController = Get.put(DataController());
    final today = DateTime.now();
    ChartWidget chart = ChartWidget(
        entiredata: dataController.transactionDataList, height: 300);
    List tempDataSet = [];

    for (TransactionModel data in entireData) {
      if (data.date.month == today.month && data.type == "Expense") {
        tempDataSet.add(data);
      }
    }

    tempDataSet.sort((a, b) => a.date.day.compareTo(b.date.day));
    for (var i = 0; i < tempDataSet.length; i++) {
      chart.dataset.add(FlSpot(tempDataSet[i].date.day.toDouble(),
          tempDataSet[i].amount.toDouble()));
    }

    return chart.dataset;
  }

  int getSumMonth(
      List<TransactionModel> entireData, int month, String transactionType) {
    int sum = 0;
    for (TransactionModel transaction in entireData) {
      if (transaction.date.month == month &&
          transaction.type == transactionType) {
        sum += transaction.amount;
      }
    }
    return sum;
  }

  List<FlSpot> getYearPlotPointsExpense(List<TransactionModel> entireData) {
    final dataController = Get.put(DataController());
    ChartWidget chart = ChartWidget(
        entiredata: dataController.transactionDataList, height: 300);
    List yearTempDataSetExpense = [];

    for (var i = 1; i <= 12; i++) {
      yearTempDataSetExpense
          .add(getSumMonth(dataController.transactionDataList, i, "Expense"));
    }

    for (var i = 0; i < yearTempDataSetExpense.length; i++) {
      chart.yearDataSetExpense
          .add(FlSpot(i + 1.toDouble(), yearTempDataSetExpense[i].toDouble()));
    }

    return chart.yearDataSetExpense;
  }

  List<FlSpot> getYearPlotPointsIncome(List<TransactionModel> entireData) {
    final dataController = Get.put(DataController());
    ChartWidget chart = ChartWidget(
        entiredata: dataController.transactionDataList, height: 300);
    List yearTempDataSetExpense = [];

    for (var i = 1; i <= 12; i++) {
      yearTempDataSetExpense
          .add(getSumMonth(dataController.transactionDataList, i, "Income"));
    }

    for (var i = 0; i < yearTempDataSetExpense.length; i++) {
      chart.yearDataSetExpense
          .add(FlSpot(i + 1.toDouble(), yearTempDataSetExpense[i].toDouble()));
    }

    return chart.yearDataSetExpense;
  }

  changeDropValue(String newVal) {
    statDropDownValue.value = newVal;
    update();
  }

  changeStatIndex(int num) {
    statIndex = num;
    update();
  }
}
