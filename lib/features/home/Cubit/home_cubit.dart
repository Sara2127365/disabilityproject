import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/request_model.dart';
import 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<RequestModel> requests = [];

  Future<void> getData() async {
    emit(HomeLoadingState());
    try {
      final snapshot = await firestore.collection('requests').get();
      requests = snapshot.docs
          .map((doc) => RequestModel.fromMap(doc.data()))
          .toList();
      emit(HomeSuccessState(requests));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}