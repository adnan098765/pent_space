// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/app_theme.dart';
import 'package:pent_space/core/utils/navigation_service.dart';
import 'package:pent_space/screens/NotificationService/local_notification_service.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'core/const/app_const.dart';
import 'screens/splash/splash_screen.dart';
import 'view_models/notifications_view_model/notifications_view_model.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  // await Hive.initFlutter();
  // await Hive.openBox("userBox");
  // // var userBox = Hive.box('userBox');
  // // await userBox.put('userId', null);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  LocalNotificationService.requestPermissionForIOS();
  final notificationVM = Get.put(NotificationViewModel());
  FirebaseMessaging.instance.getToken().then((value) {
    Fcmtoken = value!;
    log('fcmtokenMAIN abcd ' + Fcmtoken.toString());
  });
  runApp(const ProviderScope(child: MyApp()));
  FirebaseMessaging.instance.getInitialMessage().then(
    (message) {
      print("FirebaseMessaging.instance.getInitialMessage");
      if (message != null) {
        print("New Notification");
        notificationVM.messageCount.value++;
        // if (message.data['_id'] != null) {
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) => DemoScreen(
        //         id: message.data['_id'],
        //       ),
        //     ),
        //   );
        // }
      }
    },
  );
  FirebaseMessaging.onMessage.listen(
    (message) {
      print("FirebaseMessaging.onMessage.listen");

      if (message.notification != null) {
        notificationVM.messageCount.value++;
        print('Notification count  ${notificationVM.messageCount.value}');
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data11 ${message.data}");

        LocalNotificationService.createanddisplaynotification(message);
      }
    },
  );
  // 3. This method only call when App in background and not terminated(not closed)
  FirebaseMessaging.onMessageOpenedApp.listen(
    (message) {
      print("FirebaseMessaging.onMessageOpenedApp.listen");
      if (message.notification != null) {
        notificationVM.messageCount.value++;
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data22 ${message.data['_id']}");
      }
    },
  );
}

//new version 1.0.3+3
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var userBox = Hive.box('userBox');
    // AppState.setUserId(userBox.get('userId'));
    // AppState.setFullName(userBox.get('fullName'));
    // AppState.setPhone(userBox.get('phone'));
    // AppState.setEmail(userBox.get('email'));

    return Sizer(builder: (context, orientation, deviceType) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      return ScreenUtilInit(
          designSize: const Size(430, 932),
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return GetMaterialApp(
                builder: EasyLoading.init(),
                debugShowCheckedModeBanner: false,
                navigatorKey: NavigationService.instance.navigationKey,
                title: 'PentSpace',
                theme: AppTheme.getStyles(),
                home: SplashScreen()
                //CompleteSignup()

                );
          });
      //const SplashScreen());
    });
  }
}
