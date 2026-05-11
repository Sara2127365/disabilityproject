import 'package:disability/features/home/Cubit/home_cubit.dart';
import 'package:disability/features/home/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/Donors/Donors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveDonorsSection extends StatefulWidget {
  const ActiveDonorsSection({super.key});

  @override
  State<ActiveDonorsSection> createState() => _ActiveDonorsSectionState();
}

class _ActiveDonorsSectionState extends State<ActiveDonorsSection> {
  @override
  void initState() {
    context.read<HomeCubit>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Active Donors', style: StylesManager.titleText20Style),
            Text('See Map', style: StylesManager.titleText18StylePrimry),
          ],
        ),
        SizedBox(height: height * 0.01),
        SizedBox(
          height: height * 0.15,
          child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              if (state is HomeSuccessState) {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(width: width * 0.05);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: state.activeUsers.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: state.activeUsers[index].image.isEmpty
                              ? Image.asset(
                                  'assets/default_profile_image.png',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  state.activeUsers[index].image,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Text(state.activeUsers[index].name),
                      ],
                    );
                  },
                );
              } else if (state is HomeLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              return Container();
            },
          ),
        ),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManger.primaryColor,
                border: Border.all(color: ColorsManger.primaryColor, width: 2),
              ),
              child: const Center(
                child: Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
