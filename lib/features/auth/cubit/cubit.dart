import 'package:bloc/bloc.dart';
import 'package:disability/features/auth/cubit/states.dart';

import '../../../core/datasources/firebase_data_sources.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit() : super(SignInInitialStates());
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  Future<void> signIn(String email, String password) async{
    emit(SignInLoadingStates());
    try{
      await firebaseDataSource.signIn(email, password);
      emit(SignInSuccessStates('Success'));
    }
    catch (e){
      emit(SignInErrorStates(e.toString()));

    }
  }

  Future<void> signUp(String email, String password , String name) async{
    await firebaseDataSource.signUp(email, password, name);
    emit(SignUpLoadingStates());
    try{
      emit(SignUpSuccessStates('Success'));
    }
  catch (e){
    emit(SignUpErrorStates(e.toString()));
  }

}
}