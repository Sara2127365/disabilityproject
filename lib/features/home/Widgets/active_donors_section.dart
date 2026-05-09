import 'package:flutter/material.dart';
import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/Donors/Donors.dart';

class ActiveDonorsSection extends StatelessWidget {
  const ActiveDonorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Active Donors', style: StylesManager.titleText20Style),
            Text('See Map', style: StylesManager.titleText18StylePrimry),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:  [
              CircleImageWidget(imagePath: 'assets/Davide.png'),
              SizedBox(width: 70),
              CircleImageWidget(imagePath: 'assets/Sara.png'),
              SizedBox(width: 70),
              CircleImageWidget(imagePath: 'assets/Michle.png'),
              SizedBox(width: 70),
              CircleImageWidget(imagePath: 'assets/Elena.png'),
              SizedBox(width: 70),
              CircleImageWidget(imagePath: 'assets/Davide.png'),
              SizedBox(width: 70),
              CircleImageWidget(imagePath: 'assets/Sara.png'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManger.primaryColor,
                border: Border.all(
                  color: ColorsManger.primaryColor,
                  width: 2,
                ),
              ),
              child: const Center(
                child: Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
      ],
    );
  }
}