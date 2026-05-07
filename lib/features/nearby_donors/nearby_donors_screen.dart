import 'package:flutter/material.dart';

class NearbyDonorsScreen extends StatelessWidget {
  const NearbyDonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Nearby Donors",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: ListView(

          children: const [

            DonorCard(
              name: "Sarah Jenkins",
              bloodType: "A+",
              distance: "1.2 km away",
            ),

            SizedBox(height: 16),

            DonorCard(
              name: "Michael Chen",
              bloodType: "O-",
              distance: "2.8 km away",
            ),

            SizedBox(height: 16),

            DonorCard(
              name: "Elena Rodriguez",
              bloodType: "B+",
              distance: "4.5 km away",
            ),

            SizedBox(height: 16),

            DonorCard(
              name: "David Wilson",
              bloodType: "AB+",
              distance: "5.1 km away",
            ),
          ],
        ),
      ),
    );
  }
}

class DonorCard extends StatelessWidget {

  final String name;
  final String bloodType;
  final String distance;

  const DonorCard({
    super.key,
    required this.name,
    required this.bloodType,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
          ),
        ],
      ),

      child: Row(

        children: [

          const CircleAvatar(
            radius: 28,
            child: Icon(Icons.person),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  name,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(distance),
              ],
            ),
          ),

          Container(

            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),

            decoration: BoxDecoration(

              color: Colors.red,

              borderRadius:
                  BorderRadius.circular(12),
            ),

            child: Text(

              bloodType,

              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}