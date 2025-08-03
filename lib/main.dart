import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jatri_app/firebase_options.dart';
import 'package:jatri_app/src/pages/Trip%20History/trip_history_page.dart';
import 'package:jatri_app/src/service/hiveService.dart';
import 'src/app.dart';
import 'package:vibration/vibration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GetStorage.init();
  await Get.put(HiveService()).initHive();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);


  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));

  // Handle incoming messages and opened app from notification
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    Vibration.vibrate(pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500]);
    await displayLocalNotification(message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    Get.to(() => AllTripHistoryController());
    await displayLocalNotification(message);
  });

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Get FCM token and store it
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $fcmToken');
  GetStorage _storage = GetStorage();
  _storage.write('fcm_token', fcmToken);

  runApp(App());
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

 displayLocalNotification(RemoteMessage message) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    playSound: true,
    sound: RawResourceAndroidNotificationSound('noti'),
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    vibrationPattern:
        Int64List.fromList([500, 1000, 500, 2000, 500, 3000, 500, 500]),
  );

  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title ?? 'Notification',
    message.notification?.body ?? '',
    platformChannelSpecifics,
    payload: message.data.toString(),
  );
}

void setupFirebaseMessaging() {
  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
}

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  Vibration.vibrate(
    pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
  );
  await displayLocalNotification(message);
}
