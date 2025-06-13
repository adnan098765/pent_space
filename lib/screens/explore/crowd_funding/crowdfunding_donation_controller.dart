// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Services/auth/auth_services.dart';
import '../../home/home_screen.dart';

class CrowdFundingDonationController extends GetxController {
  final donationController = TextEditingController().obs;
  int? crowdfundingid;
  RxBool loading = false.obs;

  validation() {
    if (donationController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Donation Amount');
    } else {
      sendDonation();
    }
  }

  void sendDonation() async {
    try {
      loading.value = true;
      var data = {
        'crowd_funding_id': crowdfundingid,
        'donated_amount': int.parse(donationController.value.text),
      };
      print(crowdfundingid);
      var result = await AuthServices().sendDonation(data);
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        final url = response['data'];
        print(url);
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
          Get.to(() => HomeScreen());
        } else {
          throw 'Could not launch $url';
        }
        await launch(url);
        // Get.to(() => PaymentWebView(url: url));
        print('Send Success');
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
      donationController.value.clear();
    }
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

// class PaymentWebView extends StatelessWidget {
//   final String url;

//   PaymentWebView({required this.url});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Payment')),
//       body: WebView(
//         initialUrl: 'https://www.facebook.com/',
//         gestureNavigationEnabled: true,
//         javascriptMode: JavascriptMode.unrestricted,
//         userAgent:
//             'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E233 Safari/601.1',
//         navigationDelegate: (NavigationRequest request) {
//           if (request.url.contains('payment_success')) {
//             // Payment successful
//             Get.offAll(() => HomeScreen());
//           } else if (request.url.contains('payment_failure')) {
//             // Payment failed
//             Get.offAll(() => HomeScreen());
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     );
//   }
// }
