import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
    ) async {
  debugPrint(
    'Background message: ${message.notification?.title}',
  );
}

class FCMService {
  static final FCMService _instance =
  FCMService._internal();

  factory FCMService() => _instance;

  FCMService._internal();

  final FirebaseMessaging _messaging =
      FirebaseMessaging.instance;

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth _auth =
      FirebaseAuth.instance;

  final FlutterLocalNotificationsPlugin
  _localNotifications =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _requestPermission();

    await _initLocalNotifications();

    FirebaseMessaging.onBackgroundMessage(
      firebaseMessagingBackgroundHandler,
    );

    await _saveTokenToFirestore();

    _messaging.onTokenRefresh.listen(
      _onTokenRefresh,
    );

    FirebaseMessaging.onMessage.listen(
      _handleForegroundMessage,
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      _handleNotificationTap,
    );

    final initialMessage =
    await _messaging.getInitialMessage();

    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }
  }

  Future<void> _requestPermission() async {
    final settings =
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    debugPrint(
      'Notification permission: ${settings.authorizationStatus}',
    );
  }

  Future<void> _initLocalNotifications() async {
    const AndroidInitializationSettings
    androidSettings =
    AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const DarwinInitializationSettings
    iosSettings =
    DarwinInitializationSettings();

    const InitializationSettings
    initializationSettings =
    InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initializationSettings,
    );

    const AndroidNotificationChannel
    channel =
    AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description:
      'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
      channel,
    );
  }

  Future<void> _saveTokenToFirestore() async {
    final uid = _auth.currentUser?.uid;

    if (uid == null) return;

    final token =
    await _messaging.getToken();

    if (token == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .update({
      'fcmToken': token,
    });

    debugPrint(
      'FCM Token saved: $token',
    );
  }

  Future<void> _onTokenRefresh(
      String newToken,
      ) async {
    final uid = _auth.currentUser?.uid;

    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .update({
      'fcmToken': newToken,
    });

    debugPrint(
      'FCM Token refreshed',
    );
  }

  Future<void> _handleForegroundMessage(
      RemoteMessage message,
      ) async {
    debugPrint(
      'Foreground message: ${message.notification?.title}',
    );

    await _showLocalNotification(
      message,
    );

    await _saveNotificationToFirestore(
      message,
    );
  }

  void _handleNotificationTap(
      RemoteMessage message,
      ) {
    debugPrint(
      'Notification tapped: ${message.notification?.title}',
    );
  }

  Future<void> _showLocalNotification(
      RemoteMessage message,
      ) async {
    final notification =
        message.notification;

    if (notification == null) return;

    const NotificationDetails
    notificationDetails =
    NotificationDetails(
      android: AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _localNotifications.show(
      notification.hashCode,
      notification.title ?? '',
      notification.body ?? '',
      notificationDetails,
      payload: jsonEncode(
        message.data,
      ),
    );
  }

  Future<void>
  _saveNotificationToFirestore(
      RemoteMessage message,
      ) async {
    final uid = _auth.currentUser?.uid;

    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .add({
      'title':
      message.notification?.title ??
          '',
      'body':
      message.notification?.body ??
          '',
      'type':
      message.data['type'] ??
          'general',
      'isRead': false,
      'createdAt':
      FieldValue.serverTimestamp(),
    });
  }

  Future<void>
  sendWelcomeBackNotification({
    required String userName,
  }) async {
    final uid = _auth.currentUser?.uid;

    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .add({
      'title':
      'Welcome Back, $userName!',
      'body':
      'We missed you! Ready to save lives today?',
      'type': 'welcome_back',
      'isRead': false,
      'createdAt':
      FieldValue.serverTimestamp(),
    });

    debugPrint(
      'Welcome back notification sent for $userName',
    );
  }

  Future<void>
  sendWelcomeNewUserNotification({
    required String userName,
  }) async {
    final uid = _auth.currentUser?.uid;

    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .add({
      'title':
      'Welcome to BloodLink, $userName!',
      'body':
      'Your account is ready. You can now help save lives by donating blood!',
      'type': 'welcome_new',
      'isRead': false,
      'createdAt':
      FieldValue.serverTimestamp(),
    });

    debugPrint(
      'Welcome new user notification sent for $userName',
    );
  }

  Future<void> markAsRead(
      String notificationId,
      ) async {
    final uid = _auth.currentUser?.uid;

    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .doc(notificationId)
        .update({
      'isRead': true,
    });
  }
}