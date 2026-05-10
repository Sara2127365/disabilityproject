import 'package:bloc/bloc.dart';
import 'package:disability/features/auth/cubit/states.dart';


import '../../../core/datasources/firebase_data_sources.dart';
import '../../../core/datasources1/firebase_masseging/firebase_messaging.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(SignInInitialStates());

  final FirebaseDataSource firebaseDataSource = FirebaseDataSource();
  final FCMService _fcmService = FCMService();


  Future<void> signIn(String email, String password) async {
    emit(SignInLoadingStates());
    try {
      await firebaseDataSource.signIn(email, password);


      final user = await firebaseDataSource.getUser();


      await _fcmService.init();


      await _fcmService.sendWelcomeBackNotification(userName: user.name);

      emit(SignInSuccessStates('Success'));
    } catch (e) {
      emit(SignInErrorStates(e.toString()));
    }
  }


  Future<void> signUp(
      String email,
      String password,
      String name,
      String phone,
      String location,
      String blood,
      ) async {
    emit(SignUpLoadingStates());
    try {
      await firebaseDataSource.signUp(email, password, name, phone, location, blood);

      await _fcmService.init();

      await _fcmService.sendWelcomeNewUserNotification(userName: name);

      emit(SignUpSuccessStates('Success'));
    } catch (e) {
      emit(SignUpErrorStates(e.toString()));
    }
  }
}