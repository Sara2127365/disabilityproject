import 'package:disability/features/notifications/widget/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit()..getNotifications(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(
              color: ColorsManger.primaryColor,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<NotificationsCubit, NotificationsStates>(
                builder: (context, state) {
                  if (state is NotificationsLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is NotificationsErrorState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 48,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is NotificationsSuccessState) {
                    final notifications = state.notifications;

                    if (notifications.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_none,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'No notifications yet',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];

                        return GestureDetector(
                          onTap: () {
                            context
                                .read<NotificationsCubit>()
                                .markAsRead(notification.id);
                          },
                          child: NotificationCard(
                            title: notification.title,
                            body: notification.body,
                            time: _formatTime(notification.createdAt),
                            icon: _getIconForType(notification.type),
                            cardColor: notification.isRead
                                ? Colors.white
                                : const Color(0xFFFFF3F3),
                            isUnread: !notification.isRead,
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),

            // Bottom Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: ColorsManger.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Be a Hero Today",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Find blood drives near you and join our community of lifesavers.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime? date) {
    if (date == null) return '';

    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 1) {
      return 'Just now';
    }

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min ago';
    }

    if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    }

    return '${diff.inDays}d ago';
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'welcome_back':
        return Icons.waving_hand;

      case 'welcome_new':
        return Icons.celebration;

      case 'blood_request':
        return Icons.bloodtype;

      default:
        return Icons.notifications;
    }
  }
}