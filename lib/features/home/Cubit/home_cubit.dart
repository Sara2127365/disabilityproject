import 'package:disability/core/datasources/firebase_data_sources.dart';
import 'package:disability/features/auth/user_model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/request_model.dart';
import 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  final FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<RequestModel> requests = [];
  List<UserModel> activeUsers = [];

  Future<void> getData() async {
    emit(HomeLoadingState());

    try {
      requests = await firebaseDataSource.getRequests();
      activeUsers = await firebaseDataSource.getActiveUsers();
      emit(HomeSuccessState(requests: requests, activeUsers: activeUsers));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
