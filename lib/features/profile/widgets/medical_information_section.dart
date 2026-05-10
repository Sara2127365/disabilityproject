import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/profile/cubit/profile_cubit.dart';
import 'package:disability/features/profile/cubit/states.dart';
import 'package:disability/features/profile/widgets/line_divider.dart';
import 'package:disability/features/profile/widgets/medical_info_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: BlocBuilder<ProfileCubit, ProfileStates>(
              builder: (context, state) {
                final myCubit = context.read<ProfileCubit>();
                if (state is ProfileSuccessState) {
                  return Column(
                    children: [
                      MedicalInfoRecord(
                        title: 'Last Donation',
                        value: state.userModel.lastDonationDate == null
                            ? '________'
                            : state.userModel.lastDonationDate.toString().split(
                                ' ',
                              )[0],
                        valueColor: Color(0xff271716),
                      ),
                      LineDivider(),
                      MedicalInfoRecord(
                        title: 'Eligibility',
                        value: myCubit.isEligible()
                            ? 'Eligible Now'
                            : 'Not Eligible',
                        valueColor: myCubit.isEligible()
                            ? ColorsManger.primaryColor
                            : Color(0xff006578),
                        icon: myCubit.isEligible()
                            ? Icons.check_circle_outline
                            : Icons.close,
                      ),
                      LineDivider(),

                      MedicalInfoRecord(
                        title: 'Health Record',
                        value: 'View Records',
                        valueColor: Color(0xff271716),
                        icon: Icons.open_in_new,
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
