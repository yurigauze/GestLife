import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gest_life/core/constants/firebaseCollection.dart';
import 'package:gest_life/core/entity/User.dart';

class Doctor {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<CurrentUser>> getDoctorsUsersByName(name) async {
    final snapshot = await firestore
        .collection(FirebaseCollection.USER)
        .where('typeUser', isEqualTo: 'M')
        .limit(5)
        .get();

    return snapshot.docs
        .map((doc) => CurrentUser.fromJson(doc.data()))
        .toList();
  }

  // Stream<List<CurrentUser>> getListDoctorsUsers() {
  //   return FirebaseFirestore.instance
  //       .collection(FirebaseCollection.USER)
  //       .where('type', isEqualTo: 'M')
  //       .snapshots()
  //       .map((snapshot) =>
  //           snapshot.docs.map((doc) => CurrentUser.fromJson(doc)).toList());
  // }
}
