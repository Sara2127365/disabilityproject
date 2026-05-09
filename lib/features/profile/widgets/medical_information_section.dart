import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/profile/widgets/line_divider.dart';
import 'package:disability/features/profile/widgets/medical_info_record.dart';
import 'package:flutter/material.dart';

class MedicalInformationSection extends StatelessWidget {
  const MedicalInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Medical Information', style: StylesManager.black20Bold),
          SizedBox(height: height * 0.02),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                MedicalInfoRecord(
                  title: 'Last Donation',
                  value: 'Oct 24, 2023',
                  valueColor: Color(0xff271716),
                ),
                LineDivider(),
                MedicalInfoRecord(
                  title: 'Eligibility',
                  value: 'Eligible Now',
                  valueColor: Color(0xff006578),
                  icon: Icons.check_circle_outline,
                ),
                LineDivider(),

                MedicalInfoRecord(
                  title: 'Health Record',
                  value: 'View Records',
                  valueColor: ColorsManger.primaryColor,
                  icon: Icons.open_in_new,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
