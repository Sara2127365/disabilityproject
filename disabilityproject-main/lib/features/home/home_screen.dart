import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/Donation_card/donation_card.dart';
import 'package:disability/features/Donors/Donors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 226, 226),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/Davide.png',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        'Good Morning, Donor',
                        style: StylesManager.titleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.notifications,
                      color: ColorsManger.primaryColor,
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search hospitals or locations...",
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.tune),
                  ],
                ),

                SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  height: 180,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: ColorsManger.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.bloodtype,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Urgent Blood Needed!',
                              style: StylesManager.white30Bold,
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Severe shortage of O- at City General Hospital.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 18,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "Help Now",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearby Requests',
                      style: StylesManager.titleText20Style,
                    ),
                    Text(
                      'View all',
                      style: StylesManager.titleText18StylePrimry,
                    ),
                  ],
                ),

                SizedBox(height: 20),

                SizedBox(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      RequestCard(
                        icon: Icons.location_on,
                        hospitalName: "City Hospital",
                        bloodType: "O-",
                        distance: "2 km away",
                      ),
                      RequestCard(
                        icon: Icons.local_hospital,
                        hospitalName: "National Hospital",
                        bloodType: "A+",
                        distance: "5 km away",
                      ),
                      RequestCard(
                        icon: Icons.medical_services,
                        hospitalName: "Hope Medical",
                        bloodType: "B+",
                        distance: "3 km away",
                      ),
                      RequestCard(
                        icon: Icons.health_and_safety,
                        hospitalName: "Care Hospital",
                        bloodType: "AB+",
                        distance: "7 km away",
                      ),
                      RequestCard(
                        icon: Icons.favorite,
                        hospitalName: "Life Center",
                        bloodType: "O+",
                        distance: "1 km away",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Active Donors',
                          style: StylesManager.titleText20Style,
                        ),
                        Text(
                          'See Map',
                          style: StylesManager.titleText18StylePrimry,
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
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

                    SizedBox(height: 10),

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
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            )
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}