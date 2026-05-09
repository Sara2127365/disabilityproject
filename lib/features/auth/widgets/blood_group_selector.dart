import 'package:flutter/material.dart';

class BloodGroupSelector extends StatefulWidget {
  final String? selected;
  final Function(String) onSelected;

  const BloodGroupSelector({
    super.key,
    required this.onSelected,
    this.selected,
  });

  @override
  State<BloodGroupSelector> createState() => _BloodGroupSelectorState();
}

class _BloodGroupSelectorState extends State<BloodGroupSelector> {
  final List<String> bloodGroups = [
    'A+', 'A-', 'B+', 'B-',
    'O+', 'O-', 'AB+', 'AB-',
  ];

  late String selectedGroup;

  @override
  void initState() {
    super.initState();
    selectedGroup = widget.selected ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: bloodGroups.map((group) {
        final isSelected = selectedGroup == group;

        return ChoiceChip(
          label: Text(
            group,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
            ),
          ),
          selected: isSelected,
          selectedColor: Colors.red,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.red.shade200),
          ),

          onSelected: (_) {
            setState(() {
              selectedGroup = group;
            });

            widget.onSelected(group); // 👈 أهم سطر
          },
        );
      }).toList(),
    );
  }
}