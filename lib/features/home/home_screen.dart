import 'package:flutter/material.dart';

import 'Widgets/home_header.dart';
import 'Widgets/search_section.dart';
import 'Widgets/urgent_banner.dart';
import 'Widgets/nearby_requests_section.dart';
import 'Widgets/active_donors_section.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 226, 226),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                HomeHeader(),

                SizedBox(height: 20),

                SearchSection(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),

                SizedBox(height: 20),

                UrgentBanner(),

                SizedBox(height: 20),

                NearbyRequestsSection(
                  searchText: searchText,
                ),

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