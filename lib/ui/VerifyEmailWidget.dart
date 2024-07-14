import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gest_life/core/components/CosmeticElevatedButton.dart';
import 'package:gest_life/core/components/CosmeticOutlineButton.dart';
import 'package:gest_life/core/constants/colors.dart';
import 'package:gest_life/core/constants/imagePath.dart';
import 'package:gest_life/core/constants/sizes.dart';
import 'package:gest_life/core/firebase/Auth.dart';
import 'package:gest_life/core/firebase/firestore/CurrentUserDetails.dart';
import 'package:gest_life/ui/HomePageWidget.dart';

class VerifyEmailWidget extends StatefulWidget {
  const VerifyEmailWidget({Key? key}) : super(key: key);

  @override
  State<VerifyEmailWidget> createState() => _VerifyEmailWidgetState();
}

class _VerifyEmailWidgetState extends State<VerifyEmailWidget> {
  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();
  CurrentUserDetails currentUserDetails = CurrentUserDetails();

  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = currentUserDetails.isEmailVerified();

    if (!isEmailVerified) {
      firebaseAuthentication.sendVerificationEmail(context: context);

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) {
          checkEmailVerified();
        },
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isEmailVerified) {
      return const HomePageWidget();
    } else {
      var deviceHeight = MediaQuery.of(context).size.height;

      return Scaffold(
        backgroundColor: cosmeticWhiteColor,
        body: Container(
          padding: const EdgeInsets.all(cosmeticDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: const AssetImage(
                  cosmeticSentEmail,
                ),
                height: deviceHeight * 0.4,
              ),
              Column(
                children: [
                  Text(
                    'E-Mail enviado!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Verifique sua Caixa de entrada, Spam ou Lixeira.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: cosmeticFormHeight),
                  SizedBox(
                    width: double.infinity,
                    child: CosmeticElevatedButton(
                      onPressed: () {
                        firebaseAuthentication.sendVerificationEmail(
                          context: context,
                        );
                      },
                      buttonName: 'REENVIAR E-MAIL',
                    ),
                  ),
                  const SizedBox(height: cosmeticFormHeight - 10),
                  SizedBox(
                    width: double.infinity,
                    child: CosmeticOutlinedButton(
                      onPressed: () => firebaseAuthentication.signOut(
                        context: context,
                      ),
                      buttonName: 'SAIR',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
