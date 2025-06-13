// To parse this JSON data, do
//
//     final feedsModel = feedsModelFromJson(jsonString);

import 'dart:convert';

class FeedsModel {
  FeedsModel({
    this.id,
    this.media,
    this.message,
    this.comments,
    this.account,
  });

  String? id;
  String? media;
  String? message;
  List<Comment?>? comments;
  Account? account;

  factory FeedsModel.fromRawJson(String str) =>
      FeedsModel.fromJson(json.decode(str));

  static List<FeedsModel> feedsModelFromJson(dynamic str) =>
      List<FeedsModel>.from(str.map((x) => FeedsModel.fromJson(x)));

  String toRawJson() => json.encode(toJson());

  factory FeedsModel.fromJson(Map<String, dynamic> json) => FeedsModel(
        id: json["id"],
        media: json["media"],
        message: json["message"],
        comments: json["comments"] == null
            ? []
            : List<Comment?>.from(
                json["comments"]!.map((x) => Comment.fromJson(x))),
        account: Account.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "media": media,
        "message": message,
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x!.toJson())),
        "account": account!.toJson(),
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
  String? fullName;
  String? businessName;
  String? email;
  String? country;
  String? username;
  String? password;
  String? pin;
  String? otp;
  dynamic otpStatus;
  String? profilePicture;
  DateTime? created;
  dynamic project;
  dynamic feeds;
  String? msisdn;
  String? status;
  String? accountType;
  Category? category;
  Address? address;
  String? additionalDetails;
  dynamic balance;

  factory Account.fromRawJson(String str) => Account.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        fullName: json["fullName"],
        businessName: json["businessName"],
        email: json["email"],
        country: json["country"],
        username: json["username"],
        password: json["password"],
        pin: json["pin"],
        otp: json["otp"],
        otpStatus: json["otpStatus"],
        profilePicture: json["profilePicture"],
        created: DateTime.parse(json["created"]),
        project: json["project"],
        feeds: json["feeds"],
        msisdn: json["msisdn"],
        status: json["status"],
        accountType: json["accountType"],
        category: Category.fromJson(json["category"]),
        address: Address.fromJson(json["address"]),
        additionalDetails: json["additionalDetails"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "businessName": businessName,
        "email": email,
        "country": country,
        "username": username,
        "password": password,
        "pin": pin,
        "otp": otp,
        "otpStatus": otpStatus,
        "profilePicture": profilePicture,
        "created": created?.toIso8601String(),
        "project": project,
        "feeds": feeds,
        "msisdn": msisdn,
        "status": status,
        "accountType": accountType,
        "category": category!.toJson(),
        "address": address!.toJson(),
        "additionalDetails": additionalDetails,
        "balance": balance,
      };
}

class Address {
  Address({
    this.id,
    this.addressLine1,
    this.addressLine2,
    this.created,
  });

  String? id;
  String? addressLine1;
  String? addressLine2;
  dynamic created;

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "created": created,
      };
}

class Category {
  Category({
    this.id,
    this.categoryName,
    this.created,
  });

  String? id;
  String? categoryName;
  dynamic created;

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["categoryName"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "created": created,
      };
}

class Comment {
  Comment({
    this.id,
    this.feed,
    this.message,
    this.senderUsername,
  });

  String? id;
  dynamic feed;
  String? message;
  String? senderUsername;

  factory Comment.fromRawJson(String str) => Comment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        feed: json["feed"],
        message: json["message"],
        senderUsername: json["senderUsername"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "feed": feed,
        "message": message,
        "senderUsername": senderUsername,
      };
}
