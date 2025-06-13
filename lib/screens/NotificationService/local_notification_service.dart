import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"),
            iOS: DarwinInitializationSettings());
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (id) async {
        print("onSelectNotification$id}");

        // if (id != "") {
        //   print("MYTOKEN${token}");
        //   if (token != "") {
        //     print("MYTOKEN${token}");
        //     Get.to(() => NotificationScreen());
        //   } else {
        //     Get.to(() => SignIn());
        //   }
        // }
      },
    );
  }

  static requestPermissionForIOS() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
        ),
        // iOS: DarwinNotificationDetails(subtitle: "asdasd"),
      );
      if (Platform.isAndroid) {
        await _notificationsPlugin.show(
          0,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
          payload: message.data['_id'],
        );
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
