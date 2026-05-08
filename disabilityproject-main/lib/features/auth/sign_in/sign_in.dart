import 'package:disability/features/auth/cubit/cubit.dart';
import 'package:disability/features/auth/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/colors.dart';
import '../../../core/styles/styles.dart';
import '../widgets/button_custom.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/or_driver.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SignInSuccessStates) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is SignInErrorStates) {
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
                    Text(
                      " Welcome \n Back!",
                      style: StylesManager.titleTextStyle,
                    ),

                    SizedBox(height: height * 0.02),

                    Text(
                      " Please sign in to \n continue your \n journey.",
                      style: StylesManager.titleText20Style,
                    ),

                    SizedBox(height: height * 0.02),

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

                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        if (state is SignInLoadingStates) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return PrimaryButton(
                          text: 'SIGN IN',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().signIn(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                            }
                          },
                        );
                      },
                    ),

                    SizedBox(height: height * 0.03),

                    OrDivider(),
                    SizedBox(height: height * 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/signup');
                          },
                          child: const Text(
                            "Register Now",
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