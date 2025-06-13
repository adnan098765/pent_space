import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calorieBurnerChangeProvider =
    ChangeNotifierProvider<CalorieBurnerNotifier>((ref) {
  return CalorieBurnerNotifier();
});

class CalorieBurnerNotifier extends ChangeNotifier {
  bool _showMealList = false;
  get showMealList => _showMealList;

  void setMealListModal(bool value) {
    _showMealList = value;
    notifyListeners();
  }

  bool _showAddMealList = false;
  get showAddMealList => _showAddMealList;

  void setAddMealListModal(bool value) {
    _showAddMealList = value;
    notifyListeners();
  }
}
