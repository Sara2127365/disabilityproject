import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(64),
                  child: Image.asset(
                    'assets/profile_picture.png',
                    width: 128,
                    height: 128,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: BorderRadius.circular(35),
                    color: ColorsManger.primaryColor,
                  ),
                  child: Text('B+', style: StylesManager.white20Bold),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Text('Julian Rivers', style: StylesManager.black24Bold),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[850],
                  size: 20,
                ),
                Text('Portland, Oregon', style: StylesManager.grey14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
