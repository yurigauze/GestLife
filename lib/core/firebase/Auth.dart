import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gest_life/ui/WelcomeWidget.dart';

class FirebaseAuthentication {
  Future signUp({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {}

  Future signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {}

  Future signOut({required BuildContext context}) async {}

  Future resetPassword(
      {required String email, required BuildContext context}) async {}

  Future sendVerificationEmail({required BuildContext context}) async {}
}
