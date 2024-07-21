import 'package:flutter/material.dart';
import 'package:gest_life/core/components/CosmecticLoginFormWidget.dart';
import 'package:gest_life/core/components/CosmeticFormHeader.dart';
import 'package:gest_life/core/constants/imagePath.dart';
import 'package:gest_life/core/constants/sizes.dart';
import 'package:gest_life/google/GoogleSignInProvider.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 600,
            padding: const EdgeInsets.all(
              cosmeticDefaultSize,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CosmeticFormHeaderWidget(
                  image: cosmeticLoginImage,
                  tittle: 'Bem vindo(a) de volta!',
                  textStyleTittle: Theme.of(context).textTheme.headlineSmall,
                  subtittle: 'Faça login para continuar de onde parou.',
                ),
                CosmeticLoginFormWidget(),
                Column(
                  children: [
                    const Text('OU'),
                    const SizedBox(height: cosmeticFormHeight - 20),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        label: const Text(
                          'ENTRAR COM O GOOGLE',
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
