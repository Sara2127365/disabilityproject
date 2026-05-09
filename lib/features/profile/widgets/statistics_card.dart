import 'package:disability/core/styles/styles.dart';
import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final int recordNumber;
  final String recordName;
  const StatisticsCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.recordNumber,
    required this.recordName,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffFFDAD6),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(icon, color: iconColor),
          ),

          Text('$recordNumber', style: StylesManager.black24Bold),
          Text(recordName, style: StylesManager.black12Bold),
        ],
      ),
    );
  }
}
