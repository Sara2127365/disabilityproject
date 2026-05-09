import 'package:flutter/material.dart';

import 'Widgets/home_header.dart';
import 'Widgets/search_section.dart';
import 'Widgets/urgent_banner.dart';
import 'Widgets/nearby_requests_section.dart';
import 'Widgets/active_donors_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 226, 226),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                HomeHeader(),
                SizedBox(height: 20),
                SearchSection(),
                SizedBox(height: 20),
                UrgentBanner(),
                SizedBox(height: 20),
                NearbyRequestsSection(),
                SizedBox(height: 20),
                ActiveDonorsSection(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}