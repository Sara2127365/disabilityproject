import 'package:disability/core/styles/colors.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final IconData icon;
  final String hospitalName;
  final String bloodType;
  final String distance;

  RequestCard({
    super.key,
    required this.icon,
    required this.hospitalName,
    required this.bloodType,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 190,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: ColorsManger.primaryColor,
              ),
              SizedBox(width: 8),
              Text(
                hospitalName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Blood Type Needed",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 6),
          Text(
            bloodType,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                distance,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: ColorsManger.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Donate",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}