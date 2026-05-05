import 'package:flutter/material.dart';

import 'package:disability/core/styles/colors.dart';
import 'package:disability/features/auth/widgets/button_custom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/styles/styles.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/or_driver.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController checkPassWordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    checkPassWordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    checkPassWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SignUpSuccessStates) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is SignUpErrorStates) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
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
                    const Text(
                      'Create \nAccount',
                      style: StylesManager.titleTextStyle,
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'Join our inclusive learning \ncommunity today.',
                      style: StylesManager.titleText20Style,
                    ),
                    SizedBox(height: height * 0.04),

                    CustomTextFormField(
                      label: 'Full Name',
                      controller: nameController,
                      prefixIcon: Icons.person,
                      fieldType: FieldType.name,
                    ),

                    SizedBox(height: height * 0.03),

                    CustomTextFormField(
                      label: 'Email Address',
                      controller: emailController,
                      prefixIcon: Icons.email,
                      fieldType: FieldType.email,
                    ),

                    SizedBox(height: height * 0.03),

                    CustomTextFormField(
                      label: 'Password',
                      controller: passwordController,
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      fieldType: FieldType.password,
                    ),

                    SizedBox(height: height * 0.03),

                    CustomTextFormField(
                      label: 'Confirm Password',
                      controller: checkPassWordController,
                      prefixIcon: Icons.check,
                      isPassword: true,
                      matchController: passwordController,
                      fieldType: FieldType.confirmPassword,
                    ),

                    SizedBox(height: height * 0.03),

                    Center(
                      child: BlocBuilder<AuthCubit, AuthStates>(
                        builder: (context, state) {
                          if (state is SignUpLoadingStates) {
                            return const CircularProgressIndicator();
                          }

                          return PrimaryButton(
                            text: 'SIGN UP',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().signUp(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                  nameController.text.trim(),
                                );
                              }
                            },
                          );
                        },
                      ),
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