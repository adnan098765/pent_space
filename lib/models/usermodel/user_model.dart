class UserData {
  Status? status;
  Data? data;
  Null error;
  String? message;

  UserData({this.status, this.data, this.error, this.message});

  UserData.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Status {
  int? code;
  bool? success;

  Status({this.code, this.success});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? id;
  String? userName;
  String? email;
  String? phone;
  String? country;
  String? address;
  String? dateOfBirth;
  String? gender;
  String? maritalStatus;
  Null schoolAttended;
  String? profilePicture;
  Null longitude;
  Null latitude;
  String? firstKeyWord;
  String? secondKeyWord;
  String? thirdKeyWord;
  Null stripeAccountId;
  String? userType;
  int? isPrivate;
  String? fcmToken;
  int? isNotification;
  int? isDeleted;
  int? isVerified;
  int? isCompleted;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userName,
      this.email,
      this.phone,
      this.country,
      this.address,
      this.dateOfBirth,
      this.gender,
      this.maritalStatus,
      this.schoolAttended,
      this.profilePicture,
      this.longitude,
      this.latitude,
      this.firstKeyWord,
      this.secondKeyWord,
      this.thirdKeyWord,
      this.stripeAccountId,
      this.userType,
      this.isPrivate,
      this.fcmToken,
      this.isNotification,
      this.isDeleted,
      this.isVerified,
      this.isCompleted,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    schoolAttended = json['school_attended'];
    profilePicture = json['profile_picture'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    firstKeyWord = json['first_key_word'];
    secondKeyWord = json['second_key_word'];
    thirdKeyWord = json['third_key_word'];
    stripeAccountId = json['stripe_account_id'];
    userType = json['user_type'];
    isPrivate = json['is_private'];
    fcmToken = json['fcm_token'];
    isNotification = json['is_notification'];
    isDeleted = json['is_deleted'];
    isVerified = json['is_verified'];
    isCompleted = json['is_completed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['address'] = this.address;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['marital_status'] = this.maritalStatus;
    data['school_attended'] = this.schoolAttended;
    data['profile_picture'] = this.profilePicture;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['first_key_word'] = this.firstKeyWord;
    data['second_key_word'] = this.secondKeyWord;
    data['third_key_word'] = this.thirdKeyWord;
    data['stripe_account_id'] = this.stripeAccountId;
    data['user_type'] = this.userType;
    data['is_private'] = this.isPrivate;
    data['fcm_token'] = this.fcmToken;
    data['is_notification'] = this.isNotification;
    data['is_deleted'] = this.isDeleted;
    data['is_verified'] = this.isVerified;
    data['is_completed'] = this.isCompleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
