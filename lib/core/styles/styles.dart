import 'package:flutter/material.dart';

import 'colors.dart';

class StylesManager {
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 30,
    color: ColorsManger.primaryColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleText20Style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle titleText18StylePrimry = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorsManger.primaryColor,
  );

  static TextStyle white30Bold = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle white20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle primaryColor24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorsManger.primaryColor,
  );
  static TextStyle black24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle grey14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey[850],
  );
  static TextStyle black12Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle black20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle grey16 = TextStyle(fontSize: 16, color: Color(0xff5B403D));
}
