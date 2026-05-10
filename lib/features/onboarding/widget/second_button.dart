import 'package:disability/core/styles/colors.dart';
import 'package:flutter/material.dart';

class SecondButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFB7131A),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:ColorsManger.secondColor,
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}