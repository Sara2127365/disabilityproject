import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../auth/widgets/button_custom.dart';
import '../auth/widgets/custom_text_field.dart';

class CreateRequestScreen extends StatefulWidget {
  const CreateRequestScreen({super.key});

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController patientNameController;
  late TextEditingController hospitalController;
  late TextEditingController locationController;
  late TextEditingController notesController;

  String selectedBloodType = 'A+';

  int units = 1;

  int selectedPriority = 0;

  static const Color primaryGreen = Color(0xff2E8B57);

  @override
  void initState() {
    super.initState();

    patientNameController = TextEditingController();

    hospitalController = TextEditingController();

    locationController = TextEditingController();

    notesController = TextEditingController();
  }

  @override
  void dispose() {
    patientNameController.dispose();
    hospitalController.dispose();
    locationController.dispose();
    notesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF5FFF8),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),

          child: SingleChildScrollView(
            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Text(
                          "Good Morning,\nDonor",

                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
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

                  SizedBox(height: height * 0.03),

                  const Text(
                    "Post a Request",

                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Fill in the details to find a donor immediately.",

                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),

                  SizedBox(height: height * 0.03),

                  const Text("Patient Name"),

                  const SizedBox(height: 8),

                  CustomTextFormField(
                    label: 'Enter full name',
                    controller: patientNameController,
                    prefixIcon: Icons.person,
                    fieldType: FieldType.name,
                  ),

                  SizedBox(height: height * 0.025),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text("Blood Type"),

                            const SizedBox(height: 8),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white,

                                border: Border.all(
                                  color: const Color(0xffB7E4C7),
                                ),

                                borderRadius: BorderRadius.circular(14),
                              ),

                              child: DropdownButton(
                                value: selectedBloodType,

                                isExpanded: true,

                                underline: const SizedBox(),

                                items:
                                    [
                                          'A+',
                                          'A-',
                                          'B+',
                                          'B-',
                                          'O+',
                                          'O-',
                                          'AB+',
                                          'AB-',
                                        ]
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ),
                                        )
                                        .toList(),

                                onChanged: (value) {
                                  setState(() {
                                    selectedBloodType = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text("Units (Bags)"),

                            const SizedBox(height: 8),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white,

                                border: Border.all(
                                  color: const Color(0xffB7E4C7),
                                ),

                                borderRadius: BorderRadius.circular(14),
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (units > 1) {
                                        setState(() {
                                          units--;
                                        });
                                      }
                                    },

                                    icon: const Icon(
                                      Icons.remove,
                                      color: primaryGreen,
                                    ),
                                  ),

                                  Text(
                                    units.toString(),

                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        units++;
                                      });
                                    },

                                    icon: const Icon(
                                      Icons.add,
                                      color: primaryGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.025),

                  const Text("Priority Level"),

                  const SizedBox(height: 8),

                  Container(
                    padding: const EdgeInsets.all(4),

                    decoration: BoxDecoration(
                      color: const Color(0xffD8F3DC),

                      borderRadius: BorderRadius.circular(14),
                    ),

                    child: Row(
                      children: [
                        buildPriorityButton("Normal", 0),

                        buildPriorityButton("Urgent", 1),

                        buildPriorityButton("Emergency", 2),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  const Text("Hospital Search"),

                  const SizedBox(height: 8),

                  CustomTextFormField(
                    label: 'Search hospital name',

                    controller: hospitalController,

                    prefixIcon: Icons.search,

                    fieldType: FieldType.normal,
                  ),

                  SizedBox(height: height * 0.025),

                  const Text("Location"),

                  const SizedBox(height: 8),

                  CustomTextFormField(
                    label: 'Set hospital address',

                    controller: locationController,

                    prefixIcon: Icons.location_on,

                    fieldType: FieldType.normal,
                  ),

                  SizedBox(height: height * 0.025),

                  const Text("Additional Details"),

                  const SizedBox(height: 8),

                  TextFormField(
                    controller: notesController,

                    maxLines: 5,

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,

                      hintText: "Include special instructions or notes...",

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),

                        borderSide: const BorderSide(color: Color(0xffB7E4C7)),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),

                        borderSide: const BorderSide(color: primaryGreen),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  PrimaryButton(
                    text: "Post Request",

                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await FirebaseFirestore.instance
                            .collection('requests')
                            .add({
                              'patientName': patientNameController.text,

                              'bloodType': selectedBloodType,

                              'hospital': hospitalController.text,

                              'location': locationController.text,

                              'notes': notesController.text,

                              'units': units,

                              'priority': selectedPriority,

                              'createdAt': DateTime.now(),
                            });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Request Added Successfully'),
                          ),
                        );

                        patientNameController.clear();

                        hospitalController.clear();

                        locationController.clear();

                        notesController.clear();

                        setState(() {
                          selectedBloodType = 'A+';

                          units = 1;

                          selectedPriority = 0;
                        });
                      }
                    },
                  ),

                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPriorityButton(String text, int index) {
    bool isSelected = selectedPriority == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPriority = index;
          });
        },

        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),

          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,

            borderRadius: BorderRadius.circular(12),
          ),

          child: Center(
            child: Text(
              text,

              style: TextStyle(
                fontWeight: FontWeight.w600,

                color: isSelected ? primaryGreen : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
