import 'package:flutter/material.dart';

class OnboardingStack extends StatelessWidget {
  const OnboardingStack({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/circle.png',
          width: size.width * 0.7,
          fit: BoxFit.contain,
        ),
        Transform.translate(
          offset: const Offset(0, -8),
          child: Image.asset(
            'assets/onboarding.png',
            height: size.height * 0.28,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 20,
          right: size.width * 0.05,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF5A623),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.people,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}