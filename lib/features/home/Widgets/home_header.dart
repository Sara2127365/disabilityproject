import 'package:disability/features/profile/cubit/profile_cubit.dart';
import 'package:disability/features/profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        if (state is ProfileSuccessState) {
          return Row(
            children: [
              state.userModel.image.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        state.userModel.image,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),

                      child: Image.asset(
                        'assets/default_profile_image.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  'Hello, ${state.userModel.name.split(' ')[0]}',
                  style: StylesManager.titleTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.notifications, color: ColorsManger.primaryColor),
            ],
          );
        } else if (state is ProfileLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        return Container();
      },
    );
  }
}
