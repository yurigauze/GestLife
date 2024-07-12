import 'package:flutter/material.dart';
import 'package:gest_life/core/components/CosmecticLoginFormWidget.dart';
import 'package:gest_life/core/components/CosmeticFormHeader.dart';
import 'package:gest_life/core/constants/colors.dart';
import 'package:gest_life/core/constants/imagePath.dart';
import 'package:gest_life/core/constants/sizes.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

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
                        style: TextStyle(
                          color: cosmeticSecondaryColor,
                        ),
                      ),
                      onPressed: () {},
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
    );
  }
}
