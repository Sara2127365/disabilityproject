import 'package:disability/core/styles/colors.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final IconData icon;
  final String hospitalName;
  final String bloodType;
  final String distance;

  const RequestCard({
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
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: ColorsManger.primaryColor),
              const SizedBox(width: 8),
              Text(
                hospitalName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Blood Type Needed",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 6),
          Text(
            bloodType,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(distance, style: const TextStyle(color: Colors.grey)),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: ColorsManger.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
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