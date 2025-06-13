import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pent_space/core/utils/navigation_service.dart';

class PlatformDialog {
  static showModal({Key? key, title, body}) {
    if (Platform.isIOS) {
      showDialog(
        context: NavigationService.instance.getContext(),
        builder: (context) => CupertinoAlertDialog(
          title: Column(
            children: <Widget>[
              Text(title),
              const Padding(padding: EdgeInsets.only(bottom: 10))
            ],
          ),
          content: Text(body),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } else {
      showDialog<String>(
        context: NavigationService.instance.getContext(),
        builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
