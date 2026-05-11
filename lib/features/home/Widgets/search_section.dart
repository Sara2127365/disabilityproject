import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  final Function(String) onChanged;

  const SearchSection({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: "Search hospitals or locations...",
              prefixIcon:  Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding:  EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
            ),
          ),
        ),
       SizedBox(width: 12),
       Icon(Icons.tune),
      ],
    );
  }
}