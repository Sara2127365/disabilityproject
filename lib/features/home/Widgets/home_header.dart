import 'package:flutter/material.dart';
import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/Davide.png', width: 40, height: 40),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            'Good Morning, Donor',
            style: StylesManager.titleTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Icon(Icons.notifications, color: ColorsManger.primaryColor),
      ],
    );
  }
}