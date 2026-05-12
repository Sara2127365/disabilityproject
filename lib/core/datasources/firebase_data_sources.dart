import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disability/features/home/Model/request_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/user_model/user_model.dart';

import 'package:dio/dio.dart';

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
    final uid = _auth.currentUser!.uid;
    final userDoc = await _firestore.collection('users').doc(uid).get();

    final user = userDoc.data() as Map<String, dynamic>;
    return UserModel.fromJson(user);
  }

  Future<void> updateAvailability(bool value) async {
    final uid = _auth.currentUser!.uid;

    await _firestore.collection('users').doc(uid).update({
      'isAvailable': value,
    });
  }

  Future<String> uploadProfileImage(File file) async {
    final uid = _auth.currentUser!.uid;

    const cloudName = "df8gfvye0";
    const uploadPreset = "profile_upload";

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path),
      "upload_preset": uploadPreset,
    });

    final response = await Dio().post(
      "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
      data: formData,
    );

    final imageUrl = response.data["secure_url"];

    await _firestore.collection('users').doc(uid).update({'image': imageUrl});

    return imageUrl;
  }

  Future<List<UserModel>> getActiveUsers() async {
    final currentUid = _auth.currentUser!.uid;

    final eligibleDate = DateTime.now().subtract(Duration(days: 90));

    final querySnapshot = await _firestore
        .collection('users')
        .where('isAvailable', isEqualTo: true)
        .get();

    return querySnapshot.docs
        .where((doc) {
          // exclude current user
          if (doc.id == currentUid) {
            return false;
          }

          final user = UserModel.fromJson(doc.data());

          // لو null -> يظهر
          if (user.lastDonationDate == null) {
            return true;
          }

          // لو آخر تبرع من 90 يوم أو أكتر
          return user.lastDonationDate!.isBefore(eligibleDate);
        })
        .map((doc) {
          return UserModel.fromJson(doc.data());
        })
        .toList();
  }

  Future<List<RequestModel>> getRequests() async {
    final snapshot = await _firestore.collection('requests').get();

    return snapshot.docs
        .map((doc) => RequestModel.fromMap(doc.data()))
        .toList();
  }

  Future<void> updateUserStats({
    required int points,
    required int livesSaved,
    required int donations,
  }) async {
    final uid = _auth.currentUser!.uid;

    await _firestore.collection('users').doc(uid).update({
      'points': FieldValue.increment(points),
      'livesSaved': FieldValue.increment(livesSaved),
      'donations': FieldValue.increment(donations),
      'lastDonationDate': DateTime.now(),
    });
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
