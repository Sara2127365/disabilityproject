import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/profile/cubit/profile_cubit.dart';
import 'package:disability/features/profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String recordName;
  const StatisticsCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.recordName,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffFFDAD6),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(icon, color: iconColor),
          ),

          BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, state) {
              if (state is ProfileSuccessState) {
                return Text(
                  recordName == 'Donations Count'
                      ? '${state.userModel.donations}'
                      : recordName == 'Lives Saved'
                      ? '${state.userModel.livesSaved}'
                      : '${state.userModel.points}',
                  style: StylesManager.black24Bold,
                );
              }
              return Container();
            },
          ),
          Text(recordName, style: StylesManager.black12Bold),
        ],
      ),
    );
  }
}
