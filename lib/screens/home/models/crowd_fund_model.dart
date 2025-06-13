// To parse this JSON data, do
//
//     final crowdFundModel = crowdFundModelFromJson(jsonString);

import 'dart:convert';

List<CrowdFundModel2> crowdFundModelFromJson(String str) =>
    List<CrowdFundModel2>.from(
        json.decode(str).map((x) => CrowdFundModel2.fromJson(x)));

String crowdFundModelToJson(List<CrowdFundModel2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CrowdFundModel2 {
  CrowdFundModel2({
    this.id,
    this.account,
    this.title,
    this.description,
    this.createdBy,
    this.amountExpected,
    this.amountContributed,
    this.created,
    this.startDate,
    this.endDate,
    this.status,
  });

  String? id;
  Account? account;
  String? title;
  String? description;
  CreatedBy? createdBy;
  int? amountExpected;
  int? amountContributed;
  dynamic created;
  DateTime? startDate;
  DateTime? endDate;
  Status? status;

  factory CrowdFundModel2.fromJson(Map<String, dynamic> json) =>
      CrowdFundModel2(
        id: json["id"],
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        title: json["title"],
        description: json["description"],
        createdBy: createdByValues.map[json["createdBy"]]!,
        amountExpected: json["amountExpected"],
        amountContributed: json["amountContributed"],
        created: json["created"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        status: statusValues.map[json["status"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account": account?.toJson(),
        "title": title,
        "description": description,
        "createdBy": createdByValues.reverse[createdBy],
        "amountExpected": amountExpected,
        "amountContributed": amountContributed,
        "created": created,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "status": statusValues.reverse[status],
      };
}

class Account {
  Account({
    this.id,
    this.fullName,
    this.businessName,
    this.email,
    this.country,
    this.username,
    this.password,
    this.pin,
    this.otp,
    this.otpStatus,
    this.profilePicture,
    this.created,
    this.project,
    this.feeds,
    this.msisdn,
    this.status,
    this.accountType,
    this.category,
    this.address,
    this.additionalDetails,
    this.balance,
  });

  String? id;
  FullName? fullName;
  String? businessName;
  Email? email;
  Country? country;
  CreatedBy? username;
  Password? password;
  Pin? pin;
  Otp? otp;
  dynamic otpStatus;
  AdditionalDetails? profilePicture;
  DateTime? created;
  dynamic project;
  dynamic feeds;
  Msisdn? msisdn;
  Otp? status;
  AccountType? accountType;
  Category? category;
  Address? address;
  AdditionalDetails? additionalDetails;
  dynamic balance;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        fullName: fullNameValues.map[json["fullName"]]!,
        businessName: json["businessName"],
        email: emailValues.map[json["email"]]!,
        country: countryValues.map[json["country"]]!,
        username: createdByValues.map[json["username"]]!,
        password: passwordValues.map[json["password"]]!,
        pin: pinValues.map[json["pin"]]!,
        otp: otpValues.map[json["otp"]]!,
        otpStatus: json["otpStatus"],
        profilePicture: additionalDetailsValues.map[json["profilePicture"]]!,
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        project: json["project"],
        feeds: json["feeds"],
        msisdn: msisdnValues.map[json["msisdn"]]!,
        status: otpValues.map[json["status"]]!,
        accountType: accountTypeValues.map[json["accountType"]]!,
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        additionalDetails:
            additionalDetailsValues.map[json["additionalDetails"]]!,
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullNameValues.reverse[fullName],
        "businessName": businessName,
        "email": emailValues.reverse[email],
        "country": countryValues.reverse[country],
        "username": createdByValues.reverse[username],
        "password": passwordValues.reverse[password],
        "pin": pinValues.reverse[pin],
        "otp": otpValues.reverse[otp],
        "otpStatus": otpStatus,
        "profilePicture": additionalDetailsValues.reverse[profilePicture],
        "created": created?.toIso8601String(),
        "project": project,
        "feeds": feeds,
        "msisdn": msisdnValues.reverse[msisdn],
        "status": otpValues.reverse[status],
        "accountType": accountTypeValues.reverse[accountType],
        "category": category?.toJson(),
        "address": address?.toJson(),
        "additionalDetails": additionalDetailsValues.reverse[additionalDetails],
        "balance": balance,
      };
}

enum AccountType { SERVICE_PROVIDER }

final accountTypeValues =
    EnumValues({"SERVICE_PROVIDER": AccountType.SERVICE_PROVIDER});

enum AdditionalDetails { STRING }

final additionalDetailsValues =
    EnumValues({"string": AdditionalDetails.STRING});

class Address {
  Address({
    this.id,
    this.addressLine1,
    this.addressLine2,
    this.created,
  });

  String? id;
  AddressLine1? addressLine1;
  AddressLine2? addressLine2;
  dynamic created;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        addressLine1: addressLine1Values.map[json["addressLine1"]]!,
        addressLine2: addressLine2Values.map[json["addressLine2"]]!,
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "addressLine1": addressLine1Values.reverse[addressLine1],
        "addressLine2": addressLine2Values.reverse[addressLine2],
        "created": created,
      };
}

enum AddressLine1 { NO_12_SADE_ADU_STREET }

final addressLine1Values =
    EnumValues({"No 12, sade adu street": AddressLine1.NO_12_SADE_ADU_STREET});

enum AddressLine2 { OJOTA_LAGOS }

final addressLine2Values =
    EnumValues({"ojota, Lagos": AddressLine2.OJOTA_LAGOS});

class Category {
  Category({
    this.id,
    this.categoryName,
    this.created,
  });

  String? id;
  CategoryName? categoryName;
  dynamic created;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: categoryNameValues.map[json["categoryName"]]!,
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryNameValues.reverse[categoryName],
        "created": created,
      };
}

enum CategoryName { USER }

final categoryNameValues = EnumValues({"USER": CategoryName.USER});

enum Country { NG }

final countryValues = EnumValues({"NG": Country.NG});

enum Email { JAMESTADE_GMAIL_COM }

final emailValues =
    EnumValues({"jamestade@gmail.com": Email.JAMESTADE_GMAIL_COM});

enum FullName { JAMES_TADE }

final fullNameValues = EnumValues({"James Tade": FullName.JAMES_TADE});

enum Msisdn { EMPTY }

final msisdnValues = EnumValues({"*****": Msisdn.EMPTY});

enum Otp { PENDING }

final otpValues = EnumValues({"PENDING": Otp.PENDING});

enum Password { EMPTY }

final passwordValues = EnumValues({"******": Password.EMPTY});

enum Pin { EMPTY }

final pinValues = EnumValues({"****": Pin.EMPTY});

enum CreatedBy { JAMESTADE }

final createdByValues = EnumValues({"jamestade": CreatedBy.JAMESTADE});

enum Status { ACTIVE }

final statusValues = EnumValues({"ACTIVE": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
