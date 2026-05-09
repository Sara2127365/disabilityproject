import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: ColorsManger.primaryColor),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        SizedBox(width: width * 0.05),
        Text('Profile', style: StylesManager.primaryColor24Bold),
        Spacer(),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationsScreen()),
            );
          },
          icon: Icon(Icons.notifications_none),
        ),
      ],
    );
  }
}
