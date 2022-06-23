import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpenseappstate/app/data/model/transaction_model.dart';
import 'package:xpenseappstate/app/modules/home/views/home_view.dart';
import 'package:xpenseappstate/main.dart';

class HomeController extends GetxController {
  int totalBalance = 0;
  int totalIncome = 0;
  int totalExpense = 0;
  @override
  void onInit() {
    super.onInit();
    getProfileName();
  }

  int currentSelectedIntex = 0;
  bottomIndex(newIntex) {
    currentSelectedIntex = newIntex;
    update();
  }

  DateTime timeCheck = DateTime.now();
  timecontrol() {
    if (timeCheck.hour >= 0 && timeCheck.hour < 12) {
      return Text(
        'Good Morning ',
        style: GoogleFonts.signika(textStyle: const TextStyle(fontSize: 22)),
      );
    } else if (timeCheck.hour >= 12 && timeCheck.hour < 16) {
      return Text(
        'Good Afternoon ',
        style: GoogleFonts.signika(textStyle: const TextStyle(fontSize: 24)),
      );
    } else {
      return Text(
        'Good Evening ',
        style: GoogleFonts.signika(textStyle: const TextStyle(fontSize: 24)),
      );
    }
  }

  getProfileName() async {
    final sharedprfns = await SharedPreferences.getInstance();
    final profileName = sharedprfns.getString(saveKey);
    profName = profileName!;
    update();
  }

  changeChipIndex(int changeIndex) {
    monthIndex = changeIndex;
    today = changeIndex == 1
        ? DateTime.now()
        : DateTime(now.year, now.month - (changeIndex - 1), today.day);
    update();
  }

  getTotalBalance(List<TransactionModel> entiredata) {
    //SelectMonth selectMonth = SelectMonth();
    //final today = DateTime.now();

    totalBalance = 0;
    totalExpense = 0;
    totalIncome = 0;

    for (TransactionModel data in entiredata) {
      if (data.date.month == today.month) {
        if (data.type == "Income") {
          totalBalance += data.amount;
          totalIncome += data.amount;
        } else {
          totalBalance -= data.amount;
          totalExpense += data.amount;
        }
      }
    }
  }
}
