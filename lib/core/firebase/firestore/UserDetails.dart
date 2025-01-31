import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gest_life/core/constants/firebaseCollection.dart';
import 'package:gest_life/core/entity/User.dart';
import 'package:gest_life/core/firebase/firestore/CurrentUserDetails.dart';

class UserDetails {
  Future addUserDetails({required String name, required String email}) async {
    CurrentUserDetails currentUserDetails = CurrentUserDetails();

    final docUser = FirebaseFirestore.instance
        .collection(FirebaseCollection.USER)
        .doc(currentUserDetails.getCurrentUserUid());

    final user = CurrentUser(
      id: docUser.id,
      name: name.trim(),
      email: email.trim(),
      creationTime: DateTime.now(),
      imagePath: '',
    ).toJson();

    await docUser.set(user);
  }

  Future addUserImagePath(
      {required String imagePath, required CurrentUser currentUser}) async {
    CurrentUserDetails currentUserDetails = CurrentUserDetails();

    final docUser = FirebaseFirestore.instance
        .collection(FirebaseCollection.USER)
        .doc(currentUserDetails.getCurrentUserUid());

    await docUser.update({'imagePath': imagePath});
  }
}
