import 'dart:io';

import 'package:disability/core/datasources/firebase_data_sources.dart';
import 'package:disability/features/auth/user_model/user_model.dart';
import 'package:disability/features/profile/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> donateBlood() async {
    emit(ProfileLoadingState());

    try {
      await firebaseDataSource.updateUserStats(
        points: 10,
        livesSaved: 1,
        donations: 1,
      );

      userModel = await firebaseDataSource.getUser();

      emit(ProfileSuccessState(userModel: userModel!));
    } catch (e) {
      emit(ProfileErrorState(message: e.toString()));
    }
  }

  Future<void> pickAndUploadImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedImage == null) return;

      emit(ProfileLoadingState());

      final file = File(pickedImage.path);

      final imageUrl = await firebaseDataSource.uploadProfileImage(file);

      userModel = userModel!.copyWith(image: imageUrl);

      emit(ProfileSuccessState(userModel: userModel!));
    } catch (e) {
      emit(ProfileErrorState(message: e.toString()));
    }
  }

  bool isEligible() {
    if (userModel?.lastDonationDate == null) {
      return true;
    }

    final days = DateTime.now().difference(userModel!.lastDonationDate!).inDays;

    return days >= 90;
  }
}
