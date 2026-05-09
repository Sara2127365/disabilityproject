import 'package:flutter/material.dart';

import '../onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding',
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
        children: [
          
          Image.asset('assets/splash.png'),
           SizedBox(height: height * 0.03),
          Text('BloodLink',style: TextStyle(color: Color(0xFF271716),fontSize: 30),),
          SizedBox(height: height * 0.02),
          Text('Donate Blood, Save Lives')
        ],
      )),
    );
  }
}