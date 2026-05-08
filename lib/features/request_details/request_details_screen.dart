import 'package:flutter/material.dart';

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen({super.key});

  static const Color primaryGreen =
      Color(0xff2E8B57);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xffF5FFF8),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding:
                const EdgeInsets.all(18),

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 10),

                Row(

                  children: [

                    IconButton(

                      onPressed: () {

                        Navigator.pop(
                          context,
                        );
                      },

                      icon: const Icon(
                        Icons.arrow_back,
                        color:
                            primaryGreen,
                      ),
                    ),

                    const Expanded(

                      child: Text(

                        "Request Details",

                        style: TextStyle(
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              primaryGreen,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.share,
                        color:
                            primaryGreen,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.more_vert,
                        color:
                            primaryGreen,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Container(

                  height: 230,

                  decoration: BoxDecoration(

                    borderRadius:
                        BorderRadius.circular(
                      22,
                    ),

                    image:
                        const DecorationImage(

                      image: AssetImage(
                        'assets/hospital.png',
                      ),

                      fit: BoxFit.cover,
                    ),
                  ),

                  child: Stack(

                    children: [

                      Positioned(

                        top: 14,
                        right: 14,

                        child: Container(

                          padding:
                              const EdgeInsets
                                  .symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),

                          decoration:
                              BoxDecoration(

                            color:
                                Colors.red,

                            borderRadius:
                                BorderRadius
                                    .circular(
                              14,
                            ),
                          ),

                          child: const Column(

                            children: [

                              Text(

                                "AB+",

                                style:
                                    TextStyle(
                                  color:
                                      Colors.white,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  fontSize:
                                      20,
                                ),
                              ),

                              Text(

                                "NEEDED",

                                style:
                                    TextStyle(
                                  color:
                                      Colors.white,
                                  fontSize:
                                      10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(

                        left: 14,
                        bottom: 14,

                        child: Container(

                          padding:
                              const EdgeInsets
                                  .symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),

                          decoration:
                              BoxDecoration(

                            color: Colors.black
                                .withOpacity(
                              0.4,
                            ),

                            borderRadius:
                                BorderRadius
                                    .circular(
                              10,
                            ),
                          ),

                          child: const Text(

                            "City General Hospital",

                            style: TextStyle(
                              color:
                                  Colors.white,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(

                  padding:
                      const EdgeInsets.all(
                    18,
                  ),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),

                    boxShadow: [

                      BoxShadow(
                        color: Colors.grey
                            .shade200,
                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: Column(

                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Row(

                        children: [

                          Container(

                            padding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal:
                                  10,
                              vertical: 6,
                            ),

                            decoration:
                                BoxDecoration(

                              color: Colors
                                  .red
                                  .shade100,

                              borderRadius:
                                  BorderRadius
                                      .circular(
                                8,
                              ),
                            ),

                            child: const Text(

                              "Urgent Request",

                              style:
                                  TextStyle(
                                color:
                                    Colors.red,
                                fontSize:
                                    12,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ),

                          const Spacer(),

                          const Text(

                            "03",

                            style: TextStyle(
                              color:
                                  Colors.red,
                              fontSize:
                                  24,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                          height: 10),

                      const Text(

                        "Sarah Jenkins",

                        style: TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                          height: 4),

                      const Text(

                        "Critical Surgery Case",

                        style: TextStyle(
                          color:
                              Colors.grey,
                        ),
                      ),

                      const SizedBox(
                          height: 24),

                      detailRow(
                        Icons.location_on,
                        "Location",
                        "Block C, Room 402 - 2.4 km away",
                      ),

                      const SizedBox(
                          height: 16),

                      detailRow(
                        Icons.access_time,
                        "Deadline",
                        "Today, before 6:00 PM",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                Container(

                  padding:
                      const EdgeInsets.all(
                    18,
                  ),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),

                    boxShadow: [

                      BoxShadow(
                        color: Colors.grey
                            .shade200,
                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: Column(

                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Row(

                        children: [

                          const Text(

                            "Route Details",

                            style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          const Spacer(),

                          TextButton(
                            onPressed: () {},

                            child: const Text(

                              "View in Maps",

                              style: TextStyle(
                                color:
                                    primaryGreen,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                          height: 12),

                      ClipRRect(

                        borderRadius:
                            BorderRadius.circular(
                          18,
                        ),

                        child: Image.asset(
                          'assets/map.png',
                        ),
                      ),

                      const SizedBox(
                          height: 10),

                      Row(

                        children: [

                          const Icon(
                            Icons.lock_clock,
                            color:
                                primaryGreen,
                            size: 18,
                          ),

                          const SizedBox(
                              width: 6),

                          Text(

                            "8 mins drive",

                            style:
                                TextStyle(
                              color: Colors
                                  .grey
                                  .shade700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                const Text(

                  "Case Summary",

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text(

                  "Patient is scheduled for a major cardiovascular procedure this evening. Due to a recent shortage in the blood bank for AB+ type, we are reaching out to nearby eligible donors. Your contribution is vital for the safety of this procedure.",

                  style: TextStyle(
                    color:
                        Colors.grey.shade700,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 30),

                Row(

                  children: [

                    Expanded(

                      child: OutlinedButton.icon(

                        style:
                            OutlinedButton
                                .styleFrom(

                          padding:
                              const EdgeInsets
                                  .symmetric(
                            vertical: 16,
                          ),

                          side:
                              const BorderSide(
                            color:
                                primaryGreen,
                          ),

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                              14,
                            ),
                          ),
                        ),

                        onPressed: () {},

                        icon: const Icon(
                          Icons.call,
                          color:
                              primaryGreen,
                        ),

                        label: const Text(

                          "Call Hospital",

                          style: TextStyle(
                            color:
                                primaryGreen,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(

                      child:
                          ElevatedButton.icon(

                        style:
                            ElevatedButton
                                .styleFrom(

                          backgroundColor:
                              primaryGreen,

                          padding:
                              const EdgeInsets
                                  .symmetric(
                            vertical: 16,
                          ),

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                              14,
                            ),
                          ),
                        ),

                        onPressed: () {},

                        icon: const Icon(
                          Icons.favorite,
                          color:
                              Colors.white,
                        ),

                        label: const Text(

                          "Donate Now",

                          style: TextStyle(
                            color:
                                Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget detailRow(
    IconData icon,
    String title,
    String subtitle,
  ) {

    return Row(

      children: [

        Container(

          padding:
              const EdgeInsets.all(10),

          decoration: BoxDecoration(

            color:
                const Color(0xffD8F3DC),

            borderRadius:
                BorderRadius.circular(
              12,
            ),
          ),

          child: Icon(
            icon,
            color: primaryGreen,
            size: 20,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment
                    .start,

            children: [

              Text(

                title,

                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 4),

              Text(

                subtitle,

                style: const TextStyle(
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}