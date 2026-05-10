import 'package:disability/core/styles/colors.dart';
import 'package:disability/features/onboarding/widget/second_button.dart';
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

              
              Image.asset('assets/onboarding.png'),

             
              SizedBox(height: size.height * 0.03),
               Text('Find Blood Donors Easily',style: TextStyle(color: ColorsManger.primaryColor,fontWeight: FontWeight.bold,fontSize: 30)),
               SizedBox(height: size.height * 0.03), 
               Center(child: Text('Connect with nearby blood donors \n instantly and save precious time \n    during critical moments.',style: TextStyle(color: Color(0xFF5B403D)),)),
              SizedBox(height: size.height * 0.05),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child:
                      PrimaryButton(
                        text: 'Next',
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                      ),
                      
                ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child:
                      SecondButton(
                        text: 'Skip',
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                      ),
                      
                ),
                      ),

              SizedBox(height: size.height * 0.035),
             
       ],
          ),

      ),
    ),
    );
  }
}