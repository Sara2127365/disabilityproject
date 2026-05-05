import 'package:disability/core/styles/colors.dart';
import 'package:disability/features/onboarding/widget/onboarding_header.dart';
import 'package:disability/features/onboarding/widget/onboarding_stack.dart';
import 'package:flutter/material.dart';

import '../auth/widgets/button_custom.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFEEF2F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.05),

              OnboardingHeader(),

              SizedBox(height: size.height * 0.05),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child:
                      PrimaryButton(
                        text: 'START LEARNING',
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                      ),
                ),
                      ),

              SizedBox(height: size.height * 0.035),
              OnboardingStack(),
       ],
          ),

      ),
    ),
    );
  }
}