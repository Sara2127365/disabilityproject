import 'package:flutter/material.dart';

enum FieldType { normal, email, password, name, confirmPassword }

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextEditingController? matchController;
  final bool isPassword;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final FieldType fieldType;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    this.matchController,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.fieldType = FieldType.normal,
  });

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    switch (fieldType) {
      case FieldType.email:
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Invalid email';
        }
        break;

      case FieldType.password:
        if (value.length < 6) {
          return 'Password is too short';
        }
        break;

      case FieldType.name:
        if (value.length < 3) {
          return 'Name is too short';
        }
        break;

      case FieldType.confirmPassword:
        if (matchController != null && value != matchController!.text) {
          return 'Passwords do not match';
        }
        break;

      case FieldType.normal:
        break;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: _validator,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}