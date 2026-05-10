import '../model/notification_model.dart';

abstract class NotificationsStates {}

class NotificationsInitialState extends NotificationsStates {}

class NotificationsLoadingState extends NotificationsStates {}

class NotificationsSuccessState extends NotificationsStates {
  final List<NotificationModel> notifications;
  NotificationsSuccessState(this.notifications);
}


class NotificationsErrorState extends NotificationsStates {
  final String message;
  NotificationsErrorState(this.message);
}


class SendWelcomeNotificationLoadingState extends NotificationsStates {}

class SendWelcomeNotificationSuccessState extends NotificationsStates {}

class SendWelcomeNotificationErrorState extends NotificationsStates {
  final String message;
  SendWelcomeNotificationErrorState(this.message);
}


class MarkAsReadSuccessState extends NotificationsStates {}