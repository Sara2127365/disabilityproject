import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/user_model/user_model.dart';


class FirebaseDataSource {
  final FirebaseAuth _auth =
      FirebaseAuth.instance;

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  // login
  Future<void> signIn(
      String email,
      String password,
      ) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //register

  Future<void> signUp(
      String email,
      String password,
      String name,
      ) async {
    UserCredential userCredential =
    await _auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore
        .collection('users')
        .doc(userCredential.user!.uid)
        .set(UserModel(email: email, name: name) .toMap());
  }


  Future<void> logout() async {
    await _auth.signOut();
  }
}