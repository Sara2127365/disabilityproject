import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xffFFF7F7),

      appBar: AppBar(

        backgroundColor:
            Colors.transparent,

        elevation: 0,

        centerTitle: true,

        title: const Text(

          "Blood Donation",

          style: TextStyle(
            color: Colors.red,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              "Welcome 👋",

              style: TextStyle(
                fontSize: 30,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(

              "Choose an action to continue",

              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 40),

            buildCard(

              context,

              title: "Create Donation Request",

              subtitle:
                  "Post a blood request quickly",

              icon: Icons.bloodtype,

              color: Colors.red,

              route: '/createRequest',
            ),

            const SizedBox(height: 20),

            buildCard(

              context,

              title: "Nearby Donors",

              subtitle:
                  "Find donors near your area",

              icon: Icons.people,

              color: Colors.redAccent,

              route: '/nearbyDonors',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(
    BuildContext context, {

    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required String route,
  }) {

    return GestureDetector(

      onTap: () {

        Navigator.pushNamed(
          context,
          route,
        );
      },

      child: Container(

        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
              BorderRadius.circular(22),

          boxShadow: [

            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
            ),
          ],
        ),

        child: Row(

          children: [

            Container(

              padding:
                  const EdgeInsets.all(16),

              decoration: BoxDecoration(

                color:
                    color.withOpacity(0.1),

                borderRadius:
                    BorderRadius.circular(
                  16,
                ),
              ),

              child: Icon(
                icon,
                color: color,
                size: 32,
              ),
            ),

            const SizedBox(width: 18),

            Expanded(

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(

                    title,

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(

                    subtitle,

                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}