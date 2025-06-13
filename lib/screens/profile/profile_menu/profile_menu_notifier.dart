import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileMenuChangeProvider =
    ChangeNotifierProvider<ProfileMenuNotifier>((ref) {
  return ProfileMenuNotifier();
});

class ProfileMenuNotifier extends ChangeNotifier {
  String _currentTab = "crowdFunding";
  get currentTab => _currentTab;

  void setCurrentTab(String value) {
    _currentTab = value;
    notifyListeners();
  }

  String _inpputAmount = "0";
  get inpputAmount => _inpputAmount;

  void addAmount(String value) {
    if (_inpputAmount != "0") {
      if (value == "." && _inpputAmount.contains(".")) {
        return;
      }

      _inpputAmount = _inpputAmount + value;
    } else {
      if (value == "." && _inpputAmount == "0") {
        return;
      }
      _inpputAmount = value;
    }
    notifyListeners();
  }

  void clearInput() {
    if (_inpputAmount.length == 1) {
      _inpputAmount = "0";
      notifyListeners();
      return;
    }
    _inpputAmount = _inpputAmount.substring(0, _inpputAmount.length - 1);
    notifyListeners();
  }

  // Select Campain Feeds

  String _preferedGender = "any";
  get preferedGender => _preferedGender;

  void setPreferedGender(String value) {
    _preferedGender = value;
    notifyListeners();
  }

  String? _excludedItem = 'People connected with me';
  get excludedItem => _excludedItem;
  void setExcludedItem(String? value) {
    _excludedItem = value;
    notifyListeners();
  }

  // Budger and Duration
  String _duration = "any";
  get duration => _duration;

  void setDuration(String value) {
    _duration = value;
    notifyListeners();
  }

  // Payment method
  String _paymentMethod = "balance";
  get paymentMethod => _paymentMethod;

  void setPaymentMethod(String value) {
    _paymentMethod = value;
    notifyListeners();
  }
}
