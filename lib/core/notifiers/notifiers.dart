import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentTabController =
    StateNotifierProvider<CurrentScreenNotifier, String>(
        (ref) => CurrentScreenNotifier());

class CurrentScreenNotifier extends StateNotifier<String> {
  CurrentScreenNotifier() : super('home');

  void switchTab(tab) {
    state = tab;
  }
}

final acceptedController =
    StateNotifierProvider<AcceptedLocationNotifier, bool>(
        (ref) => AcceptedLocationNotifier());

class AcceptedLocationNotifier extends StateNotifier<bool> {
  AcceptedLocationNotifier() : super(false);

  void setState(value) {
    state = value;
  }
}

final setLocationController = StateNotifierProvider<SetLocationNotifier, bool>(
    (ref) => SetLocationNotifier());

class SetLocationNotifier extends StateNotifier<bool> {
  SetLocationNotifier() : super(false);

  void setState(value) {
    state = value;
  }
}
