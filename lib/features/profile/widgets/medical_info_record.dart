import 'package:disability/core/styles/styles.dart';
import 'package:flutter/material.dart';

class MedicalInfoRecord extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;
  final IconData? icon;
  const MedicalInfoRecord({
    super.key,
    required this.title,
    required this.value,
    required this.valueColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(title, style: StylesManager.grey16),
          Spacer(),
          Row(
            children: [
              Text(value, style: TextStyle(fontSize: 16, color: valueColor)),
              Icon(icon, color: valueColor, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
