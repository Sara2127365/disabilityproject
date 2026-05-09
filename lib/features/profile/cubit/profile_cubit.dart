import 'package:disability/core/datasources/firebase_data_sources.dart';
import 'package:disability/features/auth/user_model/user_model.dart';
import 'package:disability/features/profile/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  ProfileCubit() : super(ProfileInitialState());

  UserModel? userModel;

  Future<void> getUser() async {
    emit(ProfileLoadingState());
    try {
      userModel = await firebaseDataSource.getUser();
      emit(ProfileSuccessState(userModel: userModel!));
    } catch (e) {
      emit(ProfileErrorState(message: e.toString()));
    }
  }

  Future<void> toggleAvailability(bool value) async {
    userModel = userModel!.copyWith(isAvailable: value);

    await firebaseDataSource.updateAvailability(value);

    emit(ProfileSuccessState(userModel: userModel!));
  }
}
