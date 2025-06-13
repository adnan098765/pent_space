import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final femaleHealthChangeProvider = ChangeNotifierProvider<FemaleHealth>((ref) {
  return FemaleHealth();
});

class FemaleHealth extends ChangeNotifier {
  String _userGoal = "1";
  get userGoal => _userGoal;

  void setUserGoal(String value) {
    _userGoal = value;
    notifyListeners();
  }

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  get selectedDay => _selectedDay;
  get focusedDay => _focusedDay;

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _selectedDay = selectedDay;
    _focusedDay = focusedDay;
    notifyListeners();
  }
}
