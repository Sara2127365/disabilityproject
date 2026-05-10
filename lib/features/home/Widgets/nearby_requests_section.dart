import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/home_cubit.dart';
import '../Cubit/states.dart';
import 'package:disability/features/Donation_card/donation_card.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/core/styles/colors.dart';

class NearbyRequestsSection extends StatefulWidget {
  const NearbyRequestsSection({super.key});

  @override
  State<NearbyRequestsSection> createState() => _NearbyRequestsSectionState();
}

class _NearbyRequestsSectionState extends State<NearbyRequestsSection> {
  @override
  void initState() {
    context.read<HomeCubit>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Nearby', style: StylesManager.titleText20Style),
            Text('View All', style: StylesManager.titleText18StylePrimry),
          ],
        ),

        const SizedBox(height: 12),

        BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeErrorState) {
              return Center(child: Text(state.errorMessage));
            }

            if (state is HomeSuccessState) {
              final requests = state.requests;

              if (requests.isEmpty) {
                return const Center(child: Text('No requests found.'));
              }

              return SizedBox(
                height: height * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final r = requests[index];
                    return RequestCard(
                      icon: Icons.local_hospital,
                      hospitalName: r.hospital,
                      bloodType: r.bloodType,
                      distance: r.location,
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
