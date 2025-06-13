import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/female_health/pregnancy_tracker/select_cycle_length_screen.dart';

final pregnancyTraskerChangeProvider =
    ChangeNotifierProvider<PregnancyTraskerNotifier>((ref) {
  return PregnancyTraskerNotifier();
});

class PregnancyTraskerNotifier extends ChangeNotifier {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  get selectedDay => _selectedDay;
  get focusedDay => _focusedDay;

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _selectedDay = selectedDay;
    _focusedDay = focusedDay;
    AppUtils.go(const SelectCycleLengthScreen());
    notifyListeners();
  }

  String formatDate(DateTime tod) {
    final now = DateTime.now();
    final dt = DateTime(tod.year, tod.month, tod.day, now.hour, now.minute);
    final format = DateFormat('dd/MM/yyyy');
    return format.format(dt);
  }

  DateTime _selectedDate = DateTime.now();
  String get selectedDate => formatDate(_selectedDate);
  bool _hasSelectedDate = false;
  bool get hasSelectedDate => _hasSelectedDate;
  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      _hasSelectedDate = true;
      notifyListeners();
    }
  }

  bool _showBabyGrowthModal = false;
  get showBabyGrowthModal => _showBabyGrowthModal;

  void setShowBabyGrowthModal(bool value) {
    _showBabyGrowthModal = value;
    notifyListeners();
  }

  bool _showMotherChangeModal = false;
  get showMotherChangeModal => _showMotherChangeModal;

  void setShowMotherChangeModal(bool value) {
    _showMotherChangeModal = value;
    notifyListeners();
  }

  int _currentPregnancyWeek = 1;
  int get currentPregnancyWeek => _currentPregnancyWeek;
  void setCurrentPregnancyWeek(int value) {
    _currentPregnancyWeek = value;
    notifyListeners();
  }
}
