// ignore_for_file: prefer_typing_uninitialized_variables, unused_import

import 'package:shared_preferences/shared_preferences.dart';

String defaultFontFamily = "DMSans";
String baseUrl =
    "http://192.168.100.14:8085";
// String baseUrl =
//     "http://ec2-3-252-93-217.eu-west-1.compute.amazonaws.com:30301";
String kmapsKey = "AIzaSyBIA-m-pqW4hoKWI_YGMiHePodRh9Uujx4";
const String termsUrl = "https://www.carrygo.me/terms-policy";
const String policyUrl = "https://www.carrygo.me/terms-policy";
const String defaultAvatar =
    "https://res.cloudinary.com/https-carrygo-com/image/upload/v1634792681/carrygoWebAssets/avatar_t60sta.jpg";

const String registerUrl = "https://carrygo.me/register";

var useremailaddress;
var authtoken;
var refreshtoken;
var UserRole;
String Fcmtoken = '';

getToken(token) {
  authtoken = token;
}
