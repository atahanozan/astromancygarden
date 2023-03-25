import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fortunetell/core/navbar.dart';
import 'package:fortunetell/main.dart';

class FirebaseNotification {
  late final FirebaseMessaging messaging;

  void settingNotification() async {
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  void getNotifications() {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Astromancy Garden',
          channelDescription: 'Astromancy Garden',
        )
      ],
      debug: true,
    );
  }

  void connectNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    settingNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      getNotifications();
      AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      });

      Future<void> onDismissActionReceivedMethod(
          ReceivedAction receivedAction) async {
        debugPrint("onDismissActionReceivedMethod");
      }

      Future<void> onNotificationCreatedMethod(
          ReceivedNotification receivedNotification) async {
        debugPrint("onNotificationCreatedMethod");
      }

      Future<void> onNotificationDisplayedMethod(
          ReceivedNotification receivedNotification) async {
        debugPrint("onNotificationDisplayedMethod");
      }

      Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
        debugPrint("onActionReceivedMethod");
        final payload = receivedAction.payload ?? {};
        if (payload["navigate"] == "true") {
          MyApp.navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (_) => const NavBar(),
            ),
          );
        }
      }

      AwesomeNotifications().setListeners(
        onDismissActionReceivedMethod: onDismissActionReceivedMethod,
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      );

      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: event.notification?.title,
          body: event.notification?.body,
          bigPicture: event.notification?.android!.imageUrl,
          notificationLayout: NotificationLayout.BigPicture,
        ),
      );
    });
  }
}
