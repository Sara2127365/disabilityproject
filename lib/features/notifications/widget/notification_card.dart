import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final String time;
  final IconData icon;
  final Color cardColor;
  final bool isUnread;

  const NotificationCard({
    super.key,
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.cardColor,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.red),
        ),

        title: Text(
          title,
          style: TextStyle(
            fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
          ),
        ),

        subtitle: Text(body),

        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time),
          ],
        ),

      ),

    );
  }
}