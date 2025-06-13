class AppUrls {
  // static String baseUrl = "http://192.168.100.14:8085/api/user/";
  // static String globalurl = "http://192.168.100.14:8085/api/";
  // static String socketurl = "http://192.168.100.14:8085/";


  // Localhost URLs for development
  // Uncomment the following lines to use localhost during development
  static String baseUrl = "http://ec2-54-211-86-244.compute-1.amazonaws.com:8080/api/user/";
  static String globalurl = "http://ec2-54-211-86-244.compute-1.amazonaws.com:8080/api/";
  static String socketurl = "http://ec2-54-211-86-244.compute-1.amazonaws.com:8080/";



  //static String globalurl = 'https://q87nmhz7-8080.euw.devtunnels.ms/api/';
  // Auth Urls
  static String signUp = "signup";
  static String login = "login";
  static String forgetPassword = "forget_password";
  static String resetPassword = "reset_password";
  static String resendOtp = "request_otp";
  static String getUserProfile = "profile";
  static String createStore = "stores/create";
  static String productCreate = "products/create";
  static String getCategories = "lov";

  static String verifyOTP(String email, String otp) {
    return "verify_otp?otp=$otp&email=$email";
  }

  static String viewStore(String storeID) {
    return "stores/show/$storeID";
  }

  static String updateStore(String storeID) {
    return "stores/edit/$storeID";
  }

  static String updateProfile() {
    return "profile/edit";
  }


}
