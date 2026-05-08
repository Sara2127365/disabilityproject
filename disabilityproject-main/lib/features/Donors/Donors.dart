import 'package:disability/core/styles/colors.dart';
import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  final String imagePath;

  CircleImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorsManger.primaryColor,
          width: 2,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}