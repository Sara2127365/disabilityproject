import 'package:flutter/material.dart';

class LocationSelector extends StatefulWidget {
  final String? selected;
  final Function(String) onSelected;

  const LocationSelector({
    super.key,
    required this.onSelected,
    this.selected,
  });

  @override
  State<LocationSelector> createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  final List<String> locations = [
    'Cairo',
    'Giza',
    'Alexandria',
    'Dakahlia',
    'Sharqia',
    'Qalyubia',
    'Aswan',
    'Luxor',
  ];

  late String selectedLocation;

  @override
  void initState() {
    super.initState();
    selectedLocation = widget.selected ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: locations.map((loc) {
        final isSelected = selectedLocation == loc;

        return ChoiceChip(
          label: Text(
            loc,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
            ),
          ),
          selected: isSelected,
          selectedColor: Colors.blue,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.blue.shade200),
          ),

          onSelected: (_) {
            setState(() {
              selectedLocation = loc;
            });

            widget.onSelected(loc);
          },
        );
      }).toList(),
    );
  }
}