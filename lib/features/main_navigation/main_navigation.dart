import 'package:disability/core/styles/colors.dart';
import 'package:disability/features/create_request/create_request_screen.dart';
import 'package:disability/features/emergency/emergency_screen.dart';
import 'package:disability/features/home/home_screen.dart';
import 'package:disability/features/notifications/notifications_screen.dart';
import 'package:disability/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:disability/features/nearby_donors/nearby_donors_screen.dart';
import 'package:disability/features/nearby_donors/nearby_donors_screen.dart';
import 'package:disability/features/request_details/request_details_screen.dart';
import 'package:disability/features/request_details/request_details_screen.dart';
import 'package:disability/features/request_details/request_details_screen.dart';
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
      HomeScreen(),
      CreateRequestScreen(),
      EmergencyScreen(),
      NotificationsScreen(),
      ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        selectedItemColor: ColorsManger.primaryColor,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(
            icon: Icon(Icons.bloodtype),
            label: 'Requests',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Emergency',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
