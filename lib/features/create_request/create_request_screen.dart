import 'package:flutter/material.dart';

import '../../core/styles/styles.dart';
import '../auth/widgets/button_custom.dart';
import '../auth/widgets/custom_text_field.dart';
class CreateRequestScreen extends StatefulWidget {
  const CreateRequestScreen({super.key});

  @override
  State<CreateRequestScreen> createState() =>
      _CreateRequestScreenState();
}

class _CreateRequestScreenState
    extends State<CreateRequestScreen> {

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  late TextEditingController patientNameController;
  late TextEditingController bloodTypeController;
  late TextEditingController hospitalController;
  late TextEditingController phoneController;
  late TextEditingController unitsController;
  late TextEditingController notesController;

  @override
  void initState() {
    super.initState();

    patientNameController = TextEditingController();
    bloodTypeController = TextEditingController();
    hospitalController = TextEditingController();
    phoneController = TextEditingController();
    unitsController = TextEditingController();
    notesController = TextEditingController();
  }

  @override
  void dispose() {
    patientNameController.dispose();
    bloodTypeController.dispose();
    hospitalController.dispose();
    phoneController.dispose();
    unitsController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final double width =
        MediaQuery.of(context).size.width;

    final double height =
        MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Donation Request",
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),

          child: SingleChildScrollView(
            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(
                    'Create Donation Request',
                    style:
                        StylesManager.titleTextStyle,
                  ),

                  SizedBox(height: height * 0.015),

                  const Text(
                    'Fill in the details below to post a blood donation request.',
                    style:
                        StylesManager.titleText20Style,
                  ),

                  SizedBox(height: height * 0.04),

                  CustomTextFormField(
                    label: 'Patient Name',
                    controller:
                        patientNameController,
                    prefixIcon: Icons.person,
                    fieldType: FieldType.name,
                  ),

                  SizedBox(height: height * 0.03),

                  CustomTextFormField(
                    label: 'Blood Type',
                    controller:
                        bloodTypeController,
                    prefixIcon:
                        Icons.bloodtype,
                    fieldType: FieldType.normal,
                  ),

                  SizedBox(height: height * 0.03),

                  CustomTextFormField(
                    label: 'Hospital Name',
                    controller:
                        hospitalController,
                    prefixIcon:
                        Icons.local_hospital,
                    fieldType: FieldType.normal,
                  ),

                  SizedBox(height: height * 0.03),

                  CustomTextFormField(
                    label: 'Phone Number',
                    controller:
                        phoneController,
                    prefixIcon:
                        Icons.phone,
                    fieldType: FieldType.normal,
                  ),

                  SizedBox(height: height * 0.03),

                  CustomTextFormField(
                    label: 'Required Units',
                    controller:
                        unitsController,
                    prefixIcon:
                        Icons.monitor_heart,
                    fieldType: FieldType.normal,
                  ),

                  SizedBox(height: height * 0.03),

                  TextFormField(
                    controller: notesController,
                    maxLines: 4,

                    decoration: InputDecoration(
                      hintText: "Additional Notes",

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.05),

                  Center(
                    child: PrimaryButton(
                      text: 'POST REQUEST',

                      onPressed: () {

                        if (_formKey.currentState!
                            .validate()) {

                          ScaffoldMessenger.of(context)
                              .showSnackBar(

                            const SnackBar(
                              content: Text(
                                "Request Posted Successfully",
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),

                  SizedBox(height: height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}