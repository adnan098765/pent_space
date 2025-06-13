class AppState {
  static String? _userId;
  static String? get userId => _userId;

  static void setUserId(String? value) {
    _userId = value;
  }
  static String? _userPhoneNumber;
  static String? get userPhoneNumber => _userPhoneNumber;

  static void setUserPhoneNumber(String? value) {
    _userPhoneNumber = value;
  }

  static String? _userName;
  static String? get username => _userName;

  static void setUserName(String? value) {
    _userName = value;
  }
  static String? _email;
  static String? get email => _email;

  static void setEmail(String? value) {
    _email = value;
  }

  static String? _fullname;
  static String? get fullname => _fullname;

  static void setFullName(String? value) {
    _fullname = value;
  }
  static String? _phone;
  static String? get phone => _phone;

  static void setPhone(String? value) {
    _phone = value;
  }
}
