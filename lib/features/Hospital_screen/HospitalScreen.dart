import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:flutter/material.dart';

class HospitalScreen extends StatelessWidget {
  final String hospitalName;
  final String bloodType;
  final String location;

  HospitalScreen({
    super.key,
    required this.hospitalName,
    required this.bloodType,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hospitalName , style: StylesManager.white20Bold,),
        backgroundColor: ColorsManger.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Hospital: $hospitalName",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Blood Type Needed: $bloodType",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Location: $location",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManger.primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Donation request sent "),
                    ),
                  );
                },
                child: Text("Donate Now" , style: StylesManager.white20Bold,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}