import 'package:flutter/material.dart';
import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/emergency/emergency_screen.dart';

class UrgentBanner extends StatelessWidget {
  const UrgentBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ColorsManger.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.bloodtype, size: 40, color: Colors.white),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Urgent Blood Needed!',
                  style: StylesManager.white30Bold,
                ),
                const SizedBox(height: 6),

                const Text(
                  'Severe shortage of O- at City General Hospital.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 16),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const EmergencyScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Help Now",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}