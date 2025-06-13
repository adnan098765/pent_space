import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workoutChangeProvider = ChangeNotifierProvider<WorkoutNotifier>((ref) {
  return WorkoutNotifier();
});

class WorkoutNotifier extends ChangeNotifier {
  String _userLevel = "1";
  get userLevel => _userLevel;

  void setUserLevel(String value) {
    _userLevel = value;
    notifyListeners();
  }
}
