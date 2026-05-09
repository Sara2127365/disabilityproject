import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/request_model.dart';

class HomeService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<RequestModel>> getRequests() async {
    final snapshot = await firestore.collection('requests').get();

    return snapshot.docs
        .map((doc) => RequestModel.fromMap(doc.data()))
        .toList();
  }
}