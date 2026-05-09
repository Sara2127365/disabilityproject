import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/user_model/user_model.dart';

class FirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // login
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  //register

  Future<void> signUp(
    String email,
    String password,
    String name,
    String phone,
    String location,
    String blood,
  ) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore
        .collection('users')
        .doc(userCredential.user!.uid)
        .set(
          UserModel(
            email: email,
            name: name,
            phone: phone,
            location: location,
            blood: blood,
            image: '',
            donations: 0,
            livesSaved: 0,
            points: 0,
            isAvailable: false,
          ).toMap(),
        );
  }

  Future<UserModel> getUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    final user = userDoc.data() as Map<String, dynamic>;
    return UserModel.fromJson(user);
  }

  Future<void> updateAvailability(bool value) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'isAvailable': value,
    });
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
