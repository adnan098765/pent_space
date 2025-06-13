import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/models/FeedModel.dart';

final createPostChangeProvider =
    ChangeNotifierProvider<CreatePostNotifier>((ref) {
  return CreatePostNotifier();
});

class CreatePostNotifier extends ChangeNotifier {
  String _currentTab = "feeds";
  get currentTab => _currentTab;
  final List<FeedModel> _feedList = [];
  List<FeedModel> get feedList => _feedList;
  final List<CommentModel> _newCommentList = [];
  List<CommentModel> get newCommentList => _newCommentList;
  final List<String> category = [
    "Dental",
    "Pharmacy",
    "Medical",
    "Diagnostics",
    "Physiotherapy",
    "Gym",
    "Laboratory",
    "Pall Bearer",
    "Old People's Home",
    "Ophthalmologist",
    "Mortuary",
  ];

  final List _crowdFundList = [];
  List get crowdFundList => _crowdFundList;

  final bool _isFetchingCrowdFund = false;
  bool get isFetchingCrowdFund => _isFetchingCrowdFund;
  List<String> _selectedCategories = [];
  List<String> get selectedCategories => _selectedCategories;

  void setCategories(String value) {
    if (!_selectedCategories.contains(value)) {
      _selectedCategories.add(value);
    } else {
      _selectedCategories.remove(value);
    }
    notifyListeners();
  }
}
