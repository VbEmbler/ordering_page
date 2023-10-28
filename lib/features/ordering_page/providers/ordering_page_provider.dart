import 'package:flutter/material.dart';

class OrderingPageProvider extends ChangeNotifier {
  DateTime startDate = DateTime.now();

  setStartDate(DateTime date) {
    startDate = date;
    notifyListeners();
  }
}
