import 'package:disability/features/auth/user_model/user_model.dart';

import '../Model/request_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<RequestModel> requests;
  final List<UserModel> activeUsers;
  HomeSuccessState({required this.requests, required this.activeUsers});
}

class HomeErrorState extends HomeStates {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}

