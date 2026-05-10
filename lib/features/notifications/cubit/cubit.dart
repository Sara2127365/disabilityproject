import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disability/features/notifications/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/datasources1/firebase_masseging/firebase_messaging.dart';
import '../model/notification_model.dart';


class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit() : super(NotificationsInitialState());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FCMService _fcmService = FCMService();


  void getNotifications() {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    emit(NotificationsLoadingState());

    _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen(
          (snapshot) {
        final notifications = snapshot.docs
            .map((doc) => NotificationModel.fromFirestore(doc))
            .toList();
        emit(NotificationsSuccessState(notifications));
      },
      onError: (e) {
        emit(NotificationsErrorState(e.toString()));
      },
    );
  }


  Future<void> sendWelcomeBack({required String userName}) async {
    emit(SendWelcomeNotificationLoadingState());
    try {
      await _fcmService.sendWelcomeBackNotification(userName: userName);
      emit(SendWelcomeNotificationSuccessState());
    } catch (e) {
      emit(SendWelcomeNotificationErrorState(e.toString()));
    }
  }



  Future<void> sendWelcomeNewUser({required String userName}) async {
    emit(SendWelcomeNotificationLoadingState());
    try {
      await _fcmService.sendWelcomeNewUserNotification(userName: userName);
      emit(SendWelcomeNotificationSuccessState());
    } catch (e) {
      emit(SendWelcomeNotificationErrorState(e.toString()));
    }
  }


  Future<void> markAsRead(String notificationId) async {
    await _fcmService.markAsRead(notificationId);
    emit(MarkAsReadSuccessState());
  }
}