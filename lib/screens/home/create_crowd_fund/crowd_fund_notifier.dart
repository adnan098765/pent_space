import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/models/CrowdFundModel.dart';
import 'package:pent_space/models/app_state_model.dart';
import 'package:pent_space/widgets/platformDialog.dart';
import 'package:file_picker/file_picker.dart';

final crowdFundChangeProvider =
    ChangeNotifierProvider<CrowdFundNotifier>((ref) {
  return CrowdFundNotifier();
});

class CrowdFundNotifier extends ChangeNotifier {
  TextEditingController patientNameController = TextEditingController();
  TextEditingController hospitalNameController = TextEditingController();
  late TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventAmountController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController nextOfKinNameController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool _isPublishingCrowdFund = false;
  bool get isPublishingCrowdFund => _isPublishingCrowdFund;
  String? selectedGender;

  void updateSelectedGender(String? gender) {
    selectedGender = gender;
    notifyListeners();
  }

  String _country = "Name of Hospital";
  get country => _country;

  void setCountry(String value) {
    _country = value;
    notifyListeners();
  }

  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  void setDate(DateTime date) {
    _selectedDate = date;
    dateOfBirthController.text = date.toString();
    print(dateOfBirthController.text);
    notifyListeners();
  }

  String? _selectedPdfPath;

  String? get selectedPdfPath => _selectedPdfPath;

  Future<void> pickPdfFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        _selectedPdfPath = result.files.first.path;
        print(_selectedPdfPath);
        notifyListeners();
      }
    } catch (e) {
      print('Error picking PDF file: $e');
    }
  }

  void publishCrowdFund() async {
    final CrowdFundingService _crowdFundingService = CrowdFundingService();

    // AppUtils.goBack();

    try {
      if (_isPublishingCrowdFund) {
        return;
      }
      _isPublishingCrowdFund = true;
      notifyListeners();

      // Get the selected date from the controller
      DateTime selectedDate = DateTime.parse(dateOfBirthController.text);

      // Use the globalUserData to get the current user's data
      // Replace 'your_user_id_here' with the actual user ID from globalUserData
      String currentUserId = globalUserData.userId;

      // Call the CrowdFundingService to publish the project

      //  userId: currentUserId,
      //   title: eventTitleController.text,
      //   description: eventDescriptionController.text,
      //   amountExpected: double.parse(eventAmountController.text),
      //   startDate: selectedDate,
      //   endDate: selectedDate.add(Duration(days: 30)),
      CrowdFund crmodel = CrowdFund(
          userId: currentUserId,
          title: eventTitleController.text,
          description: eventDescriptionController.text,
          amountExpected: double.parse(eventAmountController.text),
          startDate: selectedDate,
          endDate: selectedDate.add(Duration(days: 30)),
          status: "status");
      await _crowdFundingService.publishCrowdFund(crmodel.toMap());

      // Update UI or show success message
      _isPublishingCrowdFund = false;
      AppUtils.goBack();
      PlatformDialog.showModal(
        title: 'Success',
        body: 'Crowdfunding request created',
      );
      notifyListeners();
    } catch (e) {
      _isPublishingCrowdFund = false;
      notifyListeners();
      PlatformDialog.showModal(title: 'Alert', body: e.toString());
    }
  }

  // publishCrowdFund() async {
  //   AppUtils.goBack();

  //   // try {
  //   //   if (_isPublishingCrowdFund) {
  //   //     return;
  //   //   }
  //   //   _isPublishingCrowdFund = true;
  //   //   notifyListeners();
  //   //   print("User Id: ${AppState.userId}");

  //   //   var res =
  //   //       await ApiService.post(path: "/project/${AppState.userId}", data: {
  //   //     "title": _eventTitleController.text,
  //   //     "description": _eventDescriptionController.text,
  //   //     "amountExpected": _eventAmountController.text,
  //   //     "amountContributed": 0,
  //   //     "startDate": "2022-11-13",
  //   //     "endDate": "2022-11-14",
  //   //     "status": "PENDING",
  //   //   });

  //   //   print(res);

  //   //   if (res["code"] == "00") {
  //   //     _isPublishingCrowdFund = false;
  //   //     AppUtils.goBack();
  //   //     PlatformDialog.showModal(
  //   //       title: 'Success',
  //   //       body: 'Croudfund request created',
  //   //     );
  //   //     notifyListeners();
  //   //   } else {
  //   //     _isPublishingCrowdFund = false;
  //   //     notifyListeners();
  //   //     PlatformDialog.showModal(title: 'Alert', body: res["error"]);
  //   //   }
  //   // } catch (e) {
  //   //   _isPublishingCrowdFund = false;
  //   //   notifyListeners();
  //   // }
  // }
}

class CrowdFundingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> publishCrowdFund(crowdFund) async {
    try {
      // Add the crowdfunding project to Firestore
      await _firestore.collection('crowdfunding_projects').add(crowdFund);
    } catch (e) {
      // Handle any errors that occur during the process
      throw Exception('Failed to publish crowdfunding project: $e');
    }
  }
}
