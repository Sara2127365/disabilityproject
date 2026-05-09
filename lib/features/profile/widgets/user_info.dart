import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/profile/cubit/profile_cubit.dart';
import 'package:disability/features/profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: BlocBuilder<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(64),
                        child: state.userModel.image.isEmpty
                            ? Image.asset(
                                'assets/default_profile_image.png',
                                width: 128,
                                height: 128,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                state.userModel.image,
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
                        child: Text(
                          state.userModel.blood,
                          style: StylesManager.white20Bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Text(state.userModel.name, style: StylesManager.black24Bold),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey[850],
                        size: 20,
                      ),
                      Text(
                        state.userModel.location,
                        style: StylesManager.grey14,
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is ProfileErrorState) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
