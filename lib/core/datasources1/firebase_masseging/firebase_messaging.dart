import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FCMService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FlutterLocalNotificationsPlugin _local =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await _messaging.requestPermission();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _local.initialize(settings);

    FirebaseMessaging.onMessage.listen((message) {
      _show(message);
      _save(message);
    });
  }

  Future<void> _show(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    await _local.show(
      0,
      notification.title,
      notification.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel_id',
          'notifications',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }


  Future<void> _save(RemoteMessage message) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .add({
      'title': message.notification?.title ?? '',
      'body': message.notification?.body ?? '',
      'isRead': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }


  Future<void> sendWelcomeBackNotification({required String userName}) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .add({
      'title': 'Welcome Back, $userName!',
      'body': 'We missed you! Ready to continue?',
      'isRead': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }


  Future<void> sendWelcomeNewUserNotification({required String userName}) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .add({
      'title': 'Welcome $userName!',
      'body': 'Your account is ready. Let’s start saving lives!',
      'isRead': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}