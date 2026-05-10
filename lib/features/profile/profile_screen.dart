import 'package:disability/core/styles/colors.dart';
import 'package:disability/features/profile/widgets/available_card.dart';
import 'package:disability/features/profile/widgets/custom_button.dart';
import 'package:disability/features/profile/widgets/medical_information_section.dart';
import 'package:disability/features/profile/widgets/profile_header.dart';
import 'package:disability/features/profile/widgets/statistics_card.dart';
import 'package:disability/features/profile/widgets/user_info.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProfileHeader(),
                SizedBox(height: height * 0.04),
                UserInfo(),
                SizedBox(height: height * 0.04),
                AvailableCard(),
                SizedBox(height: height * 0.02),
                StatisticsCard(
                  icon: Icons.bloodtype_outlined,
                  iconColor: ColorsManger.primaryColor,
                  recordName: 'Donations Count',
                ),
                SizedBox(height: height * 0.02),
                StatisticsCard(
                  icon: Icons.favorite_border_outlined,
                  iconColor: Color(0xff006578),
                  recordName: 'Lives Saved',
                ),
                SizedBox(height: height * 0.02),
                StatisticsCard(
                  icon: Icons.stars_outlined,
                  iconColor: Color(0xff5B403D),
                  recordName: 'Reward Points',
                ),
                SizedBox(height: height * 0.04),

                CustomButton(
                  onTap: () {},
                  icon: Icons.edit_outlined,
                  title: 'Edit Profile',
                ),
                SizedBox(height: height * 0.02),
                CustomButton(
                  onTap: () {},
                  icon: Icons.share_outlined,
                  title: 'Share Profile',
                ),
                SizedBox(height: height * 0.04),
                MedicalInformationSection(),
                SizedBox(height: height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
