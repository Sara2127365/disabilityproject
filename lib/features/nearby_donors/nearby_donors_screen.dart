
import 'package:flutter/material.dart';

class NearbyDonorsScreen extends StatelessWidget {
  const NearbyDonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const Color primaryGreen =
        Color(0xff2E8B57);

    return Scaffold(

      backgroundColor:
          const Color(0xffF5FFF8),

      floatingActionButton:
          FloatingActionButton(

        backgroundColor: primaryGreen,

        onPressed: () {},

        child: const Icon(
          Icons.map,
          color: Colors.white,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: 1,

        selectedItemColor: primaryGreen,
        unselectedItemColor: Colors.grey,

        onTap: (index) {

          if (index == 0) {

            Navigator.pushNamed(
              context,
              '/home',
            );
          }
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

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

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Row(

                children: [

                  const CircleAvatar(
                    radius: 22,
                    backgroundImage:
                        AssetImage(
                      'assets/avatar.png',
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(

                    child: Text(

                      "Good Morning,\nDonor",

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                        color: primaryGreen,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.notifications_none,
                      color: primaryGreen,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Container(

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 14,
                ),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(14),

                  border: Border.all(
                    color: Color(0xffB7E4C7),
                  ),
                ),

                child: const TextField(

                  decoration: InputDecoration(
                    border: InputBorder.none,

                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),

                    hintText:
                        "Search donors by location or name...",
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Row(

                children: [

                  filterChip(
                    "Blood Type: A+",
                    Icons.bloodtype,
                    true,
                  ),

                  const SizedBox(width: 10),

                  filterChip(
                    "Distance: 5km",
                    Icons.location_on,
                    false,
                  ),

                  const SizedBox(width: 10),

                  filterChip(
                    "Avail",
                    Icons.calendar_today,
                    false,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(

                "Nearby Donors",

                style: TextStyle(
                  fontSize: 24,
                  fontWeight:
                      FontWeight.bold,
                  color: primaryGreen,
                ),
              ),

              const SizedBox(height: 18),

              Expanded(

                child: ListView(

                  children: const [

                    DonorCard(
                      image:
                          'assets/Sara.png',
                      name:
                          "Sarah Jenkins",
                      bloodType: "A+",
                      distance:
                          "1.2 km away",
                    ),

                    SizedBox(height: 18),

                    DonorCard(
                      image:
                          'assets/Michle.png',
                      name:
                          "Michael Chen",
                      bloodType: "O-",
                      distance:
                          "2.8 km away",
                    ),

                    SizedBox(height: 18),

                    DonorCard(
                      image:
                          'assets/Elena.png',
                      name:
                          "Elena Rodriguez",
                      bloodType: "B+",
                      distance:
                          "4.5 km away",
                    ),

                    SizedBox(height: 18),

                    DonorCard(
                      image:
                          'assets/Davide.png',
                      name:
                          "David Wilson",
                      bloodType: "AB+",
                      distance:
                          "5.1 km away",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget filterChip(
    String text,
    IconData icon,
    bool active,
  ) {

    const Color primaryGreen =
        Color(0xff2E8B57);

    return Container(

      padding:
          const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),

      decoration: BoxDecoration(

        color: active
            ? primaryGreen
            : const Color(0xffD8F3DC),

        borderRadius:
            BorderRadius.circular(30),
      ),

      child: Row(

        children: [

          Icon(
            icon,
            size: 16,

            color: active
                ? Colors.white
                : Colors.black54,
          ),

          const SizedBox(width: 6),

          Text(

            text,

            style: TextStyle(

              color: active
                  ? Colors.white
                  : Colors.black54,

              fontWeight:
                  FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class DonorCard extends StatelessWidget {

  final String image;
  final String name;
  final String bloodType;
  final String distance;

  const DonorCard({
    super.key,
    required this.image,
    required this.name,
    required this.bloodType,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {

    const Color primaryGreen =
        Color(0xff2E8B57);

    return Container(

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(18),

        boxShadow: [

          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
          ),
        ],
      ),

      child: Column(

        children: [

          Row(

            children: [

              Stack(

                children: [

                  CircleAvatar(

                    radius: 26,

                    backgroundImage:
                        AssetImage(
                      image,
                    ),
                  ),

                  Positioned(

                    bottom: 0,
                    right: 0,

                    child: Container(

                      width: 14,
                      height: 14,

                      decoration:
                          BoxDecoration(

                        color: Colors.green,

                        shape:
                            BoxShape.circle,

                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 14),

              Expanded(

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(

                      name,

                      style:
                          const TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(

                      children: [

                        const Icon(
                          Icons.location_on,
                          size: 15,
                          color: Colors.grey,
                        ),

                        const SizedBox(width: 3),

                        Text(

                          distance,

                          style:
                              const TextStyle(
                            color:
                                Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),

                decoration: BoxDecoration(

                  color: primaryGreen,

                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                ),

                child: Text(

                  bloodType,

                  style:
                      const TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(

            children: [

              Expanded(

                child: ElevatedButton.icon(

                  style:
                      ElevatedButton.styleFrom(

                    backgroundColor:
                        primaryGreen,

                    padding:
                        const EdgeInsets.symmetric(
                      vertical: 14,
                    ),

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),

                  onPressed: () {},

                  icon: const Icon(
                    Icons.message,
                    color: Colors.white,
                  ),

                  label: const Text(
                    "Contact",

                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Container(

                padding:
                    const EdgeInsets.all(12),

                decoration: BoxDecoration(

                  color:
                      const Color(0xffD8F3DC),

                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                ),

                child: const Icon(
                  Icons.info_outline,
                  color: primaryGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}