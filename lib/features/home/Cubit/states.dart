import '../Model/request_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<RequestModel> requests;
  HomeSuccessState(this.requests);
}

class HomeErrorState extends HomeStates {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}