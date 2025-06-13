import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsChangeProvider = ChangeNotifierProvider<SettingsNotifier>((ref) {
  return SettingsNotifier();
});

class SettingsNotifier extends ChangeNotifier {
  bool _newMessage = true;
  get newMessage => _newMessage;

  toggleNewMessage() {
    _newMessage = !_newMessage;
    notifyListeners();
  }

  bool _feedsComments = false;
  get feedsComments => _feedsComments;

  toggleFeedsComments() {
    _feedsComments = !_feedsComments;
    notifyListeners();
  }

  bool _newAnswer = true;
  get newAnswer => _newAnswer;

  toggleNewAnswer() {
    _newAnswer = !_newAnswer;
    notifyListeners();
  }
}
