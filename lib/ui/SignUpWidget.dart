import 'package:flutter/material.dart';
import 'package:gest_life/core/components/CosmeticFormHeader.dart';
import 'package:gest_life/core/constants/colors.dart';
import 'package:gest_life/core/constants/imagePath.dart';
import 'package:gest_life/core/constants/sizes.dart';
import 'package:gest_life/google/GoogleSignInProvider.dart';
import 'package:gest_life/ui/LoginWidget.dart';
import 'package:gest_life/ui/SignUpFormWidget.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cosmeticWhiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: cosmeticPrimaryColor,
        ),
      ),
      backgroundColor: cosmeticWhiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(
            cosmeticDefaultSize,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CosmeticFormHeaderWidget(
                image: cosmeticSignUp,
                tittle: 'Boas vindas!',
                textStyleTittle: Theme.of(context).textTheme.headlineSmall,
                subtittle: 'Crie seu perfil para começar sua jornada.',
              ),
              CosmeticSignUpFormWidget(),
              Column(
                children: [
                  const Text('OU'),
                  const SizedBox(height: cosmeticFormHeight - 20),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      label: const Text(
                        'ENTRAR COM O GOOGLE',
                        style: TextStyle(
                          color: cosmeticSecondaryColor,
                        ),
                      ),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false,
                        );
                        provider.googleLogin(context: context);
                      },
                      icon: const Image(
                        image: AssetImage(
                          cosmeticGoogleLogoImage,
                        ),
                        width: 20.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginWidget(),
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Já possui uma conta? ',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const TextSpan(
                            text: 'LOGIN',
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
