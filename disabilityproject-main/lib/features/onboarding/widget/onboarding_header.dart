import 'package:flutter/material.dart';
import 'package:disability/core/styles/colors.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: ColorsManger.primaryColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.sign_language,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'SignLearn',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1B6B5A),
              ),
            ),
          ],
        ),

        SizedBox(height: size.height * 0.045),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: const Text(
            'Master the power of visual communication.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A2E),
              height: 1.3,
            ),
          ),
        ),

        SizedBox(height: size.height * 0.025),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: const Text(
            'A beautiful, intuitive journey designed to bridge the gap through the beauty of sign language.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF888888),
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}