import 'package:pent_space/core/utils/app_utils.dart';

class AppStateModel {
  final String firstName;
  final String lastName;
  final String firstKeyword;
  final String secKeyword;
  final String thirdKeyword;

  final String phone;
  final String email;
  final String avatar;
  final String userId;
  final bool isOnline;
  final String country;
  final String address;

  final String token;
  final bool userBoolean;
  final String brandName;

  String image;
  final List<String> categories;

  // Additional fields
  final String dateOfBirth;
  final String gender;
  final String maritalStatus;
  final String profession;
  final String schoolAttended;
  final List<String> friends; // List to store friends
  final List<String> friendRequests; // List to store friend requests

  AppStateModel({
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.userId,
    required this.isOnline,
    required this.country,
    required this.token,
    required this.userBoolean,
    required this.brandName,
    required this.image,
    required this.categories,
    required this.dateOfBirth,
    required this.gender,
    required this.maritalStatus,
    required this.profession,
    required this.schoolAttended,
    this.firstKeyword = "",
    this.secKeyword = "",
    this.thirdKeyword = "",
    List<String>? friends, // Initialize friends list in the constructor
    List<String>? friendRequests,
  })  : friends = friends ?? [],
        friendRequests = friendRequests ?? [];

  factory AppStateModel.fromJson(Map<String, dynamic> json) {
    return AppStateModel(
      address: json["address"] ?? "",
      firstKeyword: json["firstKeyword"] ?? "",
      secKeyword: json["secKeyword"] ?? "",
      thirdKeyword: json["thirdKeyword"] ?? "",

      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      avatar: json["avatar"] ?? "",
      userId: json["id"] ?? "",
      isOnline: json["isOnline"] ?? false,
      country: json["country"] ?? "",
      token: json["token"] ?? "",
      userBoolean: json["userBoolean"] ?? false,
      brandName: json["brandName"] ?? "",
      image: json["image"] ?? "",
      categories: json["categories"] != null
          ? List<String>.from(json["categories"])
          : [],
      dateOfBirth: json["dateOfBirth"] ?? "",
      gender: json["gender"] ?? "",
      maritalStatus: json["maritalStatus"] ?? "",
      profession: json["profession"] ?? "",
      schoolAttended: json["schoolAttended"] ?? "",
      friends: json['friends'] != null
          ? List<String>.from(json['friends'])
          : [], // Initialize friends from JSON
      friendRequests: json['friendRequests'] != null
          ? List<String>.from(json['friendRequests'])
          : [], // Initialize friendRequests from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstKeyword": firstKeyword,
      "secKeyword": secKeyword,
      "thirdKeyword": thirdKeyword,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'id': userId,
      'isOnline': isOnline,
      'country': country,
      'token': token,
      'userBoolean': userBoolean,
      'brandName': brandName,
      'image': image == "" ? globalimage : image,
      'categories': categories,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'profession': profession,
      'schoolAttended': schoolAttended,
      'friends': friends, // Include friends in JSON
      'friendRequests': friendRequests, // Include friendRequests in JSON
      'address': address,
    };
  }

  void clearUserData() {
    globalUserData = AppStateModel(
      address: "",
      firstName: "",
      lastName: "",
      email: "",
      phone: "",
      avatar: "",
      userId: "",
      isOnline: false,
      country: "",
      token: "",
      userBoolean: false,
      brandName: "",
      image: "",
      categories: [],
      dateOfBirth: "",
      gender: "",
      maritalStatus: "",
      profession: "",
      schoolAttended: "",
    );
  }
}

late AppStateModel globalUserData;
