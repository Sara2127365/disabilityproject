import 'package:disability/core/styles/colors.dart';
import 'package:disability/core/styles/styles.dart';
import 'package:disability/features/auth/cubit/cubit.dart';
import 'package:disability/features/auth/cubit/states.dart';
import 'package:disability/features/auth/sign_in/sign_in.dart';
import 'package:disability/features/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is UnauthenticatedState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/signin',
            (route) => false,
          );
        }
      },
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: ColorsManger.primaryColor),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          SizedBox(width: width * 0.05),
          Text('Profile', style: StylesManager.primaryColor24Bold),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              );
            },
            icon: Icon(Icons.notifications_none),
          ),
          GestureDetector(
            onTap: () async {
              await context.read<AuthCubit>().logout();
            },
            child: Row(
              children: [
                Text(
                  'Log out',
                  style: TextStyle(color: ColorsManger.primaryColor),
                ),
                const SizedBox(width: 6),
                Icon(Icons.logout_outlined, color: ColorsManger.primaryColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
