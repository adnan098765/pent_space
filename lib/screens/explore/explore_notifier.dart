import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/explore/crowd_funding/crowd_funding_success_screen.dart';

final exploreChangeProfider = ChangeNotifierProvider<ExploreNotifier>((ref) {
  return ExploreNotifier();
});

class ExploreNotifier extends ChangeNotifier {
  ExploreNotifier() {
    _fetchCrowdFund();
  }
  String _currentTab = "answers";
  get currentTab => _currentTab;

  void setCurrentTab(String value) {
    _currentTab = value;
    notifyListeners();
  }

  final List _crowdFundList = [];
  List get crowdFundList => _crowdFundList;

  final bool _isFetchingCrowdFund = false;
  bool get isFetchingCrowdFund => _isFetchingCrowdFund;
  _fetchCrowdFund() async {
    // try {
    //   if (_isFetchingCrowdFund) {
    //     return;
    //   }
    //   _isFetchingCrowdFund = true;
    //   notifyListeners();
    //   var res = await ApiService.get(path: "/project");

    //   if (res["code"] == "00") {
    //     _isFetchingCrowdFund = false;

    //     _crowdFundList = res["otherDetails"]["data"];
    //     notifyListeners();
    //   } else {
    //     _isFetchingCrowdFund = false;
    //     notifyListeners();
    //     PlatformDialog.showModal(title: 'Alert', body: res["error"]);
    //   }
    // } catch (e) {
    //   _isFetchingCrowdFund = false;
    //   notifyListeners();
    // }
  }

  late final TextEditingController _donationController =
      TextEditingController(text: '');
  TextEditingController get donationController => _donationController;

  String _selectedDonation = "0";
  String get selectedDonation => _selectedDonation;

  void setDonation(String value) {
    _selectedDonation = value;
    notifyListeners();
  }

  final bool _isFundingCroudFund = false;
  bool get isFundingCroudFund => _isFundingCroudFund;
  fundPfoject(project) async {
    AppUtils.go(const CrowdFundingSuccessScreen());

    // try {
    //   if (_isFundingCroudFund) {
    //     return;
    //   }
    //   _isFundingCroudFund = true;
    //   // AppUtils.go(const CrowdFundingSuccessScreen());

    //   notifyListeners();

    //   print(
    //     {
    //       "payee": {
    //         "name": project["account"]["fullName"],
    //         "email": project["account"]["email"],
    //         "msisdn": project["account"]["msisdn"],
    //       },
    //       "payer": {
    //         "name": AppState.fullname,
    //         "email": AppState.email,
    //         "msisdn": AppState.phone,
    //         "pin": "123456"
    //       },
    //       "amount": _selectedDonation == "0"
    //           ? _donationController.text
    //           : _selectedDonation,
    //       "transactionType": "TRANSFER",
    //       "status": "PENDING",
    //     },
    //   );

    //   var res = await ApiService.post(
    //     path: "/project/fund/${project["id"]}",
    //     data: {
    //       "payee": {
    //         "name": AppState.fullname,
    //         "email": AppState.email,
    //         "msisdn": AppState.phone,
    //       },
    //       "payer": {
    //         "name": project["account"]["fullName"],
    //         "email": project["account"]["email"],
    //         "msisdn": project["account"]["msisdn"],
    //         "pin": "123456"
    //       },
    //       "amount": _selectedDonation == "0"
    //           ? _donationController.text
    //           : _selectedDonation,
    //       "transactionType": "TRANSFER",
    //       "status": "PENDING",
    //     },
    //   );

    //   print(res);

    //   if (res["code"] == "00") {
    //     _isFundingCroudFund = false;

    //     AppUtils.go(const CrowdFundingSuccessScreen());
    //     PlatformDialog.showModal(
    //       title: 'Success',
    //       body: "Donation accepted successfully",
    //     );
    //     notifyListeners();
    //   } else {
    //     _isFundingCroudFund = false;
    //     notifyListeners();
    //     PlatformDialog.showModal(title: 'Alert', body: res["message"]);
    //   }
    // } catch (e) {
    //   print(e);
    //   _isFundingCroudFund = false;
    //   notifyListeners();
    //   PlatformDialog.showModal(title: 'Alert', body: "Could not fund project");
    // }
  }
}
