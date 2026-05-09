import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:flutter/material.dart';

class AvailableCard extends StatefulWidget {
  const AvailableCard({super.key});

  @override
  State<AvailableCard> createState() => _AvailableCardState();
}

class _AvailableCardState extends State<AvailableCard> {
  bool isAvailable = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            'Available for Emergencies\nBe notified for urgent donor requests',
            style: StylesManager.black12Bold,
          ),
          Spacer(),
          Switch(
            value: isAvailable,
            activeColor: ColorsManger.primaryColor,
            onChanged: (value) {
              setState(() {
                isAvailable = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
