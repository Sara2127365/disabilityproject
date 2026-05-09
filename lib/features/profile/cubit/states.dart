import 'package:disability/features/auth/user_model/user_model.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  final UserModel userModel;

  ProfileSuccessState({required this.userModel});
}

class ProfileErrorState extends ProfileStates {
  final String message;

  ProfileErrorState({required this.message});
}
