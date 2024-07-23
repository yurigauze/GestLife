import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gest_life/core/components/CosmeticBottomNavigationBar.dart';
import 'package:gest_life/core/firebase/firestore/CurrentUserDetails.dart';
import 'package:gest_life/ui/ProfileUserWidget.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentUserDetails currentUserDetails = CurrentUserDetails();
    return StreamBuilder<DocumentSnapshot>(
      stream: currentUserDetails.readUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
              child: Text("Erro ao carregar dados: ${snapshot.error}"));
        } else if (snapshot.hasData && snapshot.data!.data() != null) {
          Map<String, dynamic> userData =
              snapshot.data!.data() as Map<String, dynamic>;
          if (userData['typeUser'] == null) {

            return ProfileUserWidget(
                name: userData['name'], email: userData['email']);
          } else {
            return Center(child: Text('Bem-vindo, ${userData['name']}!'));
          }
        } else {
          return const CosmeticBottomNavigationBar();
        }
      },
    );
  }
}
