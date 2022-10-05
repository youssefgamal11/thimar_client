import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thimar_app/core/styles/colors.dart';

import 'cache_helper.dart';

class GlobalNotification {
  static String _deviceToken = "";

  static Future<String> getFcmToken() async {
    if (_deviceToken != "") {
      return _deviceToken;
    }
    _deviceToken = await FirebaseMessaging.instance.getToken() ?? "";
    // if (Prefs.getString("device_token") != _deviceToken) GlobalNotification().updateFcm();
    // Prefs.setString("device_token", _deviceToken);
    CacheHelper.setDeviceToken(_deviceToken);
    log("--------- Global Notification Logger --------> \x1B[37m------ FCM TOKEN -----\x1B[0m");
    log('<--------- Global Notification Logger --------> \x1B[32m $_deviceToken\x1B[0m');
    return _deviceToken;
  }

  late FirebaseMessaging _firebaseMessaging;

  StreamController<Map<String, dynamic>> get notificationSubject {
    return _onMessageStreamController;
  }

  void killNotification() {
    _onMessageStreamController.close();
  }

  late FlutterLocalNotificationsPlugin _notificationsPlugin;

  Map<String, dynamic> _not = {};

  Future<void> setUpFirebase() async {
    await getFcmToken();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.setAutoInitEnabled(true);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    // checkLastMessage();
    firebaseCloudMessagingListeners();

    _notificationsPlugin = FlutterLocalNotificationsPlugin();

    _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    var android = const AndroidInitializationSettings('@drawable/ic_launcher');
    var ios = const IOSInitializationSettings(
        defaultPresentBadge: true,
        defaultPresentAlert: true,
        defaultPresentSound: true);
    var initSetting = InitializationSettings(android: android, iOS: ios);
    _notificationsPlugin.initialize(initSetting,
        onSelectNotification: onSelectNotification);
  }

  Future<void> firebaseCloudMessagingListeners() async {
    if (Platform.isIOS) iOSPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage data) {
      log("--------- Global Notification Logger --------> \x1B[37m------ on Notification message data -----\x1B[0m");
      log('<--------- Global Notification Logger --------> \x1B[32m ${data.data}\x1B[0m');

      _onMessageStreamController.add(data.data);

      _not = data.data;
      if (Platform.isAndroid) {
        showNotificationWithAttachment(data);
      } else {
        showNotificationWithAttachment(data);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage data) {
      log("--------- Global Notification Logger --------> \x1B[37m------ on Opened -----\x1B[0m");
      log('<--------- Global Notification Logger --------> \x1B[32m ${data.data}\x1B[0m');
      handlePath(data.data);
    });
  }

  showNotification(
      Map<String, dynamic> _message, String title, String body) async {
    var androidt = const AndroidNotificationDetails('channel_id', 'سلة ثمار',
        channelDescription: 'سلة ثمار',
        priority: Priority.high,
        channelShowBadge: true,
        playSound: true,
        ticker: 'ticker',
        colorized: true,
        color: greenButtonColor,
        icon: "drawable/ic_launcher",
        enableVibration: true,
        enableLights: true,
        importance: Importance.max);
    var iost = const IOSNotificationDetails();
    var platform = NotificationDetails(android: androidt, iOS: iost);
    await _notificationsPlugin.show(0, title, body, platform, payload: "");
  }

  Future<void> showNotificationWithAttachment(RemoteMessage data) async {
    var iOSPlatformSpecifics = const IOSNotificationDetails();

    var androidChannelSpecifics = const AndroidNotificationDetails(
      'channel_id',
      "سلة ثمار",
      channelDescription: "سلة ثمار",
      importance: Importance.high,
      priority: Priority.high,
    );
    var notificationDetails = NotificationDetails(
        android: androidChannelSpecifics, iOS: iOSPlatformSpecifics);
    if (data.notification != null) {
      await _notificationsPlugin.show(
        0,
        data.notification!.title,
        data.notification!.body,
        notificationDetails,
      );
    }
  }

  // Future<void> showNotificationWithAttachment(Map<String, dynamic> _message, String title, String body, String imageUrl) async {
  //   debugPrint("Notification Response : $_message");
  //   // var attachmentPicturePath =
  //   //     await _downloadAndSaveFile(imageUrl, 'attachment_img.jpg');
  //   var iOSPlatformSpecifics = const IOSNotificationDetails(
  //       // attachments: [IOSNotificationAttachment(attachmentPicturePath)],
  //       );
  //   // var bigPictureStyleInformation = BigPictureStyleInformation(
  //   //   FilePathAndroidBitmap(attachmentPicturePath),
  //   //   contentTitle: '<b>$title</b>',
  //   //   htmlFormatContentTitle: true,
  //   //   summaryText: '$body',
  //   //   htmlFormatSummaryText: true,
  //   // );
  //   var androidChannelSpecifics = const AndroidNotificationDetails(
  //     'channel_id',
  //     'channel_name',
  //     channelDescription: "سلة ثمار",
  //     importance: Importance.high,
  //     priority: Priority.high,
  //     // styleInformation: bigPictureStyleInformation,
  //   );
  //   var notificationDetails = NotificationDetails(android: androidChannelSpecifics, iOS: iOSPlatformSpecifics);
  //   debugPrint("notificationDetails $notificationDetails");
  //   await _notificationsPlugin.show(
  //     0,
  //     title,
  //     body,
  //     notificationDetails,
  //   );
  // }

  // _downloadAndSaveFile(String url, String fileName) async {
  //   var directory = await getApplicationDocumentsDirectory();
  //   var filePath = '${directory.path}/$fileName';
  //   var response = await http.get(Uri.parse(url));
  //   var file = File(filePath);
  //   await file.writeAsBytes(response.bodyBytes);
  //   return filePath;
  // }

  void iOSPermission() {
    _firebaseMessaging.requestPermission(
        alert: true, announcement: true, badge: true, sound: true);
  }

  void handlePath(Map<String, dynamic> dataMap) {
    handlePathByRoute(dataMap);
  }

  Future<void> handlePathByRoute(Map<String, dynamic> dataMap) async {
    String type = dataMap["key"].toString();
    log("--------- Global Notification Logger --------> \x1B[37m------ key -----\x1B[0m");
    log('<--------- Global Notification Logger --------> \x1B[32m $type\x1B[0m');

    // push(navigator.currentContext, NotificationView());
  }

  Future<void> onSelectNotification(String? onSelectNotification) async {
    log("--------- Global Notification Logger --------> \x1B[37m------ payload -----\x1B[0m");
    log('<--------- Global Notification Logger --------> \x1B[32m $onSelectNotification\x1B[0m');
    handlePath(_not);
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage data) async {
  // If you're going to use other Firebase services in the dat, such as Firestore,
  // make sure you call initializeApp before using other Firebase services.
  // _onMessageStreamController.add(message.data);
  // if (Platform.isAndroid) {
  //   GlobalNotification().showNotificationWithAttachment(
  //       data.data,
  //       data.notification.title,
  //       data.notification.body,
  //       data.notification.android.imageUrl);
  // } else {
  //   GlobalNotification().showNotificationWithAttachment(
  //       data.data,
  //       data.notification.title,
  //       data.notification.body,
  //       data.notification.apple.imageUrl);
  // }
  // debugPrint("Handling a background message: ${data.data}");
}

StreamController<Map<String, dynamic>> _onMessageStreamController =
    StreamController.broadcast();
