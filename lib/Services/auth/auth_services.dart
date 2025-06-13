// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:pent_space/core/const/app_const.dart';

import '../core/app_urls.dart';

class AuthServices {
  UserSignUp(data) async {
    /// Url
    String url = AppUrls.baseUrl;
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await http.post(Uri.parse('${AppUrls.baseUrl}register'),
        headers: headers, body: json.encode(data));

    return response;
  }

  UserSignIn(data) async {
    /// Url
    String url = AppUrls.baseUrl;
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.post(Uri.parse('${AppUrls.baseUrl}login'),
        headers: headers, body: json.encode(data));

    return response;
  }

  UserSignOut(data) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.post(Uri.parse('${AppUrls.baseUrl}logout'),
        headers: headers, body: json.encode(data));

    return response;
  }

  DeleteMyAccount() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.delete(Uri.parse('${AppUrls.baseUrl}delete/me'),
        headers: headers);

    return response;
  }

  VerifyOtp(data) async {
    String url = AppUrls.baseUrl;
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await http.post(Uri.parse('${AppUrls.baseUrl}verify_otp'),
        headers: headers, body: json.encode(data));

    return response;
  }

  ResendOtp(data) async {
    String url = AppUrls.baseUrl;
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await http.post(Uri.parse('${AppUrls.baseUrl}resend_otp'),
        headers: headers, body: json.encode(data));

    return response;
  }

  ForgetPassword(data) async {
    /// Url
    String url = AppUrls.baseUrl;
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await http.post(
        Uri.parse('${AppUrls.baseUrl}forget_password'),
        headers: headers,
        body: json.encode(data));

    return response;
  }

  ResetPassword(data) async {
    /// Url
    String url = AppUrls.baseUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.post(
        Uri.parse('${AppUrls.baseUrl}reset_password'),
        headers: headers,
        body: json.encode(data));

    return response;
  }

  CreateUserProfile(data) async {
    String url = AppUrls.baseUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('${url}create_profile'));
    request.fields.addAll({
      'full_name': data['full_name'],
      'user_name': data['user_name'],
      'phone': data['phone'],
      'date_of_birth':data['dob'].toString(),
      'address': data['address'],
      'country': data['country'],
    });
    request.files.add(await http.MultipartFile.fromPath(
        'user_profile_picture', data['user_profile_picture']));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return response;
  }

  CreateServiceProvider(data) async {
    String url = AppUrls.baseUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('${url}create_profile'));
    request.fields.addAll({
      'business_name': data['business_name'],
      'phone': data['phone'],
      'country': data['country'],
      'date_of_birth':data['dob'].toString(),
      'address': data['address'],
      'first_key_word': data['first_key_word'],
      'second_key_word': data['second_key_word'],
      'third_key_word': data['third_key_word']
    });
    File file = File(data['business_profile_picture']);

    request.files.add(await http.MultipartFile.fromPath(
      'user_profile_picture',
      file.path,
      contentType: MediaType("image",
          "${file.path.split('.').last}"), // Specify the mime type here
    ));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return response;
  }

  getUserData() async {
    String url = AppUrls.baseUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${AppUrls.baseUrl}me'),
      headers: headers,
    );
    return response;
  }

  CreateFeed(data) async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var request = http.MultipartRequest('POST', Uri.parse('${url}feed'));
    request.fields.addAll({
      'about': data['about'],
    });
    if (data['feed_picture'] != null) {
      File file = File(data['feed_picture']);
      request.files.add(await http.MultipartFile.fromPath(
        'feed_picture',
        file.path,
        contentType: MediaType("image",
            "${file.path.split('.').last}"), // Specify the mime type here
      ));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  getAllFeeds() async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${url}feed'),
      headers: headers,
    );
    return response;
  }

  getMyFeeds() async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${url}feed/me'),
      headers: headers,
    );
    return response;
  }

  deleteFeed(feedid) async {
    String url = AppUrls.globalurl;
    var headers = {'Authorization': authtoken.toString()};
    var response = await http.delete(
      Uri.parse('${url}feed/${feedid}'),
      headers: headers,
    );
    return response;
  }

  PostComment(data) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.post(
        Uri.parse('${AppUrls.globalurl}feed/comment'),
        headers: headers,
        body: json.encode(data));

    return response;
  }

  AddLike(data) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.post(Uri.parse('${AppUrls.globalurl}feed/like'),
        headers: headers, body: json.encode(data));

    return response;
  }

  getPostComments(feedid) async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${url}feed/${feedid}'),
      headers: headers,
    );
    return response;
  }

  deleteComments(feedid) async {
    String url = AppUrls.globalurl;
    var headers = {'Authorization': authtoken.toString()};
    var response = await http.delete(
      Uri.parse('${url}feed/comment/${feedid}'),
      headers: headers,
    );
    return response;
  }

  CreateEnquiry(data) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.post(
        Uri.parse('${AppUrls.globalurl}questionnaires'),
        headers: headers,
        body: json.encode(data));

    return response;
  }

  getAllQuestions() async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${url}questionnaires'),
      headers: headers,
    );
    return response;
  }

  getMyQuestions() async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${url}questionnaires/me'),
      headers: headers,
    );
    return response;
  }

  PostAnswer(data) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.post(
        Uri.parse('${AppUrls.globalurl}questionnaires/answer'),
        headers: headers,
        body: json.encode(data));

    return response;
  }

  getAllAnswers(questionid) async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${url}questionnaires/${questionid}'),
      headers: headers,
    );
    return response;
  }

  deleteQuestion(questionid) async {
    String url = AppUrls.globalurl;
    var headers = {'Authorization': authtoken.toString()};
    var response = await http.delete(
      Uri.parse('${url}questionnaires/${questionid}'),
      headers: headers,
    );
    return response;
  }

  deleteAnswer(questionid) async {
    String url = AppUrls.globalurl;
    var headers = {'Authorization': authtoken.toString()};
    var response = await http.delete(
      Uri.parse('${url}questionnaires/answer/${questionid}'),
      headers: headers,
    );
    return response;
  }

  getServiceCategories() async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${url}service_category'),
      headers: headers,
    );
    return response;
  }

  CreateServices(data) async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var request = http.MultipartRequest('POST', Uri.parse('${url}service'));
    request.fields.addAll({
      'service_name': data['service_name'],
      'description': data['description'],
      'service_category_id': data['service_category_id'],
      'longitude': data['longitude'],
      'latitude': data['latitude'],
      'country': data['country']
    });
    if (data['service_image'] != null) {
      File file = File(data['service_image']);
      request.files.add(await http.MultipartFile.fromPath(
        'service_image',
        file.path,
        contentType: MediaType("image",
            "${file.path.split('.').last}"), // Specify the mime type here
      ));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  getAllServices(params) async {
    String url = AppUrls.globalurl + 'service?';
    url += 'longitude=${params['longitude']}&latitude=${params['latitude']}';
    Map<String, String> queryParams = {
      'longitude': params['longitude'].toString(),
      'latitude': params['latitude'].toString(),
    };
    if (params['first_key_word'].isNotEmpty) {
      url += '&first_key_word=${params['first_key_word']}';
    }
    if (params['second_key_word'].isNotEmpty) {
      url += '&second_key_word=${params['first_key_word']}';
    }

    if (params['third_key_word'].isNotEmpty) {
      url += '&third_key_word=${params['third_key_word']}';
    }
    if (params['street'].isNotEmpty) {
      url += '&street=${params['street']}';
    }
    if (params['city'].isNotEmpty) {
      url += '&city=${params['city']}';
    }
    if (params['state'].isNotEmpty) {
      url += '&state=${params['state']}';
    }
    if (params['country'].isNotEmpty) {
      url += '&country=${params['country']}';
    }

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    print('url  ${url}');
    var response = await http.get(
      Uri.parse('${url}'),
      headers: headers,
    );
    print(response.toString());
    return response;
  }

  CreateCrowdFunding(data) async {
    print('data ${data}');

    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('${url}crowd_funding'));
    request.fields.addAll({
      'title': data['title'],
      'description': data['description'],
      'patient_name': data['patient_name'],
      'patient_gender': data['patient_gender'],
      'date_of_birth': data['date_of_birth'],
      'hospital_name': data['hospital_name'],
      'amount': data['amount'],
      'next_of_kin_name': data['next_of_kin_name'],
      'next_of_kin_relation': data['next_of_kin_relation'],
      'next_of_kin_phone': data['next_of_kin_phone'],
      'end_datetime': data['end_datetime']
    });
    if (data['crowd_funding_images'] != null) {
      for (var i = 0; i < data['crowd_funding_images'].length; i++) {
        var multipartFile = await http.MultipartFile.fromPath(
          'crowd_funding_images',
          data['crowd_funding_images'][i],
          filename: data['crowd_funding_images'][i].split('/').last,
          contentType: MediaType(
              "image", "${data['crowd_funding_images'][i].split('.').last}"),
        );
        request.files.add(multipartFile);
      }
    }

    if (data['crowd_funding_docs'] != null) {
      for (var i = 0; i < data['crowd_funding_docs'].length; i++) {
        var multipartFile = await http.MultipartFile.fromPath(
          'crowd_funding_docs',
          data['crowd_funding_docs'][i],
          filename: data['crowd_funding_docs'][i].split('/').last,
          contentType: MediaType(
              "image", "${data['crowd_funding_docs'][i].split('.').last}"),
        );
        request.files.add(multipartFile);
      }
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  getAllCrowFundings() async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${url}crowd_funding'),
      headers: headers,
    );
    return response;
  }

  getMyCrowFundings() async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${url}crowd_funding/me'),
      headers: headers,
    );
    return response;
  }

  DeleteCrowdFunding(data) async {
    var mydata = json.encode({'is_active': false});
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.patch(
      Uri.parse('${AppUrls.globalurl}crowd_funding/${data['id']}'),
      headers: headers,
      body: mydata,
    );

    return response;
  }

  getAllChats(reciverid, chatid) async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      reciverid != null
          ? Uri.parse('${url}chat?recipient_id=${reciverid}')
          : Uri.parse('${url}chat?chat_id=${chatid}'),
      headers: headers,
    );
    return response;
  }

  SendFCMToken(data) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.patch(Uri.parse('${AppUrls.globalurl}user/me'),
        headers: headers, body: json.encode(data));

    return response;
  }

  sendDonation(data) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.post(Uri.parse('${AppUrls.globalurl}donation'),
        headers: headers, body: json.encode(data));

    return response;
  }

  getNotifications() async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.get(
      Uri.parse('${url}notifications'),
      headers: headers,
    );
    return response;
  }

  // EditProfile(data) async {
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': authtoken.toString()
  //   };

  //   var request = http.MultipartRequest('POST', Uri.parse('${url}feed'));
  //   request.fields.addAll({
  //     'about': data['about'],
  //   });
  //   var response = await http.patch(Uri.parse('${AppUrls.globalurl}user/me'),
  //       headers: headers, body: json.encode(data));

  //   return response;
  // }

  EditProfile(data) async {
    String url = AppUrls.globalurl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var request = http.MultipartRequest('PATCH', Uri.parse('${url}user/me'));
    request.fields
        .addAll({'user_name': data['business_name'], 'phone': data['phone']});
    if (data['user_profile_picture'] != null) {
      File file = File(data['user_profile_picture']);
      request.files.add(await http.MultipartFile.fromPath(
        'user_profile_picture',
        file.path,
        contentType: MediaType("image",
            "${file.path.split('.').last}"), // Specify the mime type here
      ));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  blockUser(data) async {
    String url = AppUrls.baseUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authtoken.toString()
    };
    var response = await http.post(Uri.parse('${url}block'),
        headers: headers, body: json.encode(data));
    return response;
  }
}
