import 'package:disability/core/styles/colors.dart';
import 'package:disability/features/Hospital_screen/HospitalScreen.dart';
import 'package:disability/features/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestCard extends StatelessWidget {
  final IconData icon;
  final String hospitalName;
  final String bloodType;
  final String distance;

  RequestCard({
    super.key,
    required this.icon,
    required this.hospitalName,
    required this.bloodType,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.7,
      height: height * 0.8,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: ColorsManger.primaryColor),
              SizedBox(width: width * 0.02),
              Text(
                hospitalName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          Text("Blood Type Needed", style: TextStyle(color: Colors.grey)),
          Text(
            bloodType,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(distance, style: TextStyle(color: Colors.grey)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => ProfileCubit(),
                        child: HospitalScreen(
                          hospitalName: hospitalName,
                          bloodType: bloodType,
                          location: distance,
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: ColorsManger.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Donate",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
