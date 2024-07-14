import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gest_life/ui/VerifyEmailWidget.dart';
import 'package:gest_life/ui/WelcomeWidget.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<void> googleLogin({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? _user;

    try {
      print("Google login");
      await googleSignIn.signOut();

      print("Login seguindo");

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      _user = googleUser;
      final googleAuth = await googleUser.authentication;

      final credential =
          GoogleAuthProvider.credential(accessToken: googleAuth.accessToken);

      await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const VerifyEmailWidget(),
            ),
            (Route<dynamic> route) => false,
          );
        },
      );
    } catch (error) {
      print("Erro durante o login: $error");
      // Aqui você pode mostrar uma mensagem de erro amigável para o usuário
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao fazer login com Google: $error')),
      );
    }

    Future googleLogout({required BuildContext context}) async {
      await GoogleSignIn().signOut().then(
            (value) => {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const WelcomeWidget(),
                ),
                (Route<dynamic> route) => false,
              ),
            },
          );
    }
  }
}
