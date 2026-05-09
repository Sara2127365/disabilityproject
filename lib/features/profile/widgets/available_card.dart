import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/profile/cubit/profile_cubit.dart';
import 'package:disability/features/profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvailableCard extends StatelessWidget {
  const AvailableCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            'Available for Emergencies\nBe notified for urgent donor requests',
            style: StylesManager.black12Bold,
          ),
          Spacer(),
          BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, state) {
              if (state is ProfileSuccessState) {
                return Switch(
                  value: state.userModel.isAvailable,
                  activeColor: ColorsManger.primaryColor,
                  onChanged: (value) {
                    
                    context.read<ProfileCubit>().toggleAvailability(value);
                  },
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
