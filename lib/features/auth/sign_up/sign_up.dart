import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:disability/core/styles/colors.dart';
import 'package:disability/features/auth/widgets/button_custom.dart';
import 'package:disability/features/auth/widgets/blood_group_selector.dart';
import 'package:disability/features/auth/widgets/custom_text_field.dart';
import 'package:disability/features/auth/widgets/or_driver.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final bloodController = TextEditingController();
  final locationController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
    bloodController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void _showLocationPicker() {
    final locations = [
      'Cairo',
      'Giza',
      'Alexandria',
      'Dakahlia',
      'Sharqia',
      'Qalyubia',
    ];

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(locations[index]),
            onTap: () {
              setState(() {
                locationController.text = locations[index];
              });
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SignUpSuccessStates) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is SignUpErrorStates) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFDAD6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.bloodtype,
                          color: Color(0xFFB7131A),
                          size: 28,
                        ),
                      ),
                    ),

                    const Center(
                      child: Text(
                        'Join BloodLink',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    const Text(
                      'Your contribution can save up to three lives.',
                      style: TextStyle(fontSize: 18),
                    ),

                    SizedBox(height: height * 0.04),

                    CustomTextFormField(
                      label: 'Full Name',
                      controller: nameController,
                      fieldType: FieldType.name,
                    ),

                    SizedBox(height: height * 0.02),

                    CustomTextFormField(
                      label: 'Phone Number',
                      controller: phoneController,
                      fieldType: FieldType.phoneNumber,
                    ),

                    SizedBox(height: height * 0.02),

                    CustomTextFormField(
                      label: 'Email',
                      controller: emailController,
                      fieldType: FieldType.email,
                    ),

                    SizedBox(height: height * 0.02),

                    CustomTextFormField(
                      label: 'Password',
                      controller: passwordController,
                      suffixIcon: const Icon(Icons.visibility),
                      isPassword: true,
                      fieldType: FieldType.password,
                    ),

                    SizedBox(height: height * 0.02),

                    /// BLOOD GROUP
                    CustomTextFormField(
                      label: 'Blood Group',
                      controller: bloodController,
                      fieldType: FieldType.blood,
                      readOnly: true,
                      suffixIcon: bloodController.text.isNotEmpty
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.arrow_drop_down),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (_) => Padding(
                            padding: const EdgeInsets.all(16),
                            child: BloodGroupSelector(
                              selected: bloodController.text,
                              onSelected: (value) {
                                setState(() {
                                  bloodController.text = value;
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: height * 0.02),

                    /// LOCATION
                    CustomTextFormField(
                      label: 'Location',
                      controller: locationController,
                      fieldType: FieldType.location,
                      readOnly: true,
                      suffixIcon: locationController.text.isNotEmpty
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.arrow_drop_down),
                      onTap: _showLocationPicker,
                    ),

                    SizedBox(height: height * 0.04),

                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        if (state is SignUpLoadingStates) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return PrimaryButton(
                          text: 'Create Account',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().signUp(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                nameController.text.trim(),
                                phoneController.text.trim(),
                                locationController.text.trim(),
                                bloodController.text.trim()
                              );
                            }
                          },
                        );
                      },
                    ),

                    SizedBox(height: height * 0.03),

                    const OrDivider(),

                    SizedBox(height: height * 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/signin');
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                              color: ColorsManger.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
