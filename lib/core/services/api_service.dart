// import 'dart:convert';
// import 'dart:io';

// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:pent_space/core/const/app_const.dart';
// import 'package:pent_space/widgets/platformDialog.dart';

// abstract class ApiService {
//   var userBox = Hive.box('userBox');
//   static get({
//     String path = "/",
//     String version = "",
//     Map<String, String>? headers,
//   }) async {
//     var userBox = Hive.box('userBox');
//     final postsURL = Uri.parse(baseUrl + version + path);
//     http.Response res = await http.get(
//       postsURL,
//       headers: headers ??
//           <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//             'Accept': 'application/json',
//             HttpHeaders.authorizationHeader: 'Bearer ${userBox.get('token')}',
//           },
//     );

//     var body = jsonDecode(res.body);

//     if (body["code"] == "00") {
//       return body;
//     } else {
//       //  PlatformDialog.showModal(body: body["message"], title: "Error");
//       return body;
//     }
//   }

//   static post({
//     String path = "/",
//     String version = "",
//     Map<String, String>? headers,
//     Object? data,
//   }) async {
//     var userBox = Hive.box('userBox');
//     final postsURL = Uri.parse(baseUrl + version + path);
//     print("POST: $postsURL");
//     http.Response res = await http.post(
//       postsURL,
//       headers: headers ??
//           <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//             'Accept': 'application/json',
//             HttpHeaders.authorizationHeader: 'Bearer ${userBox.get('token')}',
//           },
//       body: jsonEncode(data),
//     );

//     print("Omo: ${res.body}");

//     var body = jsonDecode(res.body);

//     print("status code: ${res.statusCode}");

//     if (body["code"] == "00") {
//       return body;
//     } else {
//       // PlatformDialog.showModal(body: body["message"], title: "Error");
//       return body;
//     }
//   }

//   static multipartRequest({
//     String path = "/",
//     String version = "",
//     String requestType = "POST",
//     Map<String, String>? headers,
//     List<http.MultipartFile>? fileList,
//     Map<String, String>? dataList,
//   }) async {
//     var userBox = Hive.box('userBox');
//     final postsURL = Uri.parse(baseUrl + version + path);
//     print("path: $path");
//     var request = http.MultipartRequest(
//       requestType,
//       Uri.parse(baseUrl + version + path),
//     );
//     request.headers.addAll({
//       "Accept": "application/json",
//       HttpHeaders.authorizationHeader: 'Bearer ${userBox.get('token')}',
//     });

//     for (var item in fileList!) {
//       request.files.add(item);
//     }
//     if (dataList != null) {
//       request.fields.addAll(dataList);
//     }

//     var res = await request.send();
//     var data = await res.stream.bytesToString();

//     dynamic body = jsonDecode(data);

//     print("status code: ${res.statusCode}");

//     if (body["code"] == "00") {
//       return body;
//     } else {
//       // PlatformDialog.showModal(body: body["message"], title: "Error");
//       return body;
//     }
//   }
// }
