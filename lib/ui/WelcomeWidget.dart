import 'package:flutter/material.dart';
import 'package:gest_life/core/components/CosmeticElevatedButton.dart';
import 'package:gest_life/core/constants/imagePath.dart';
import 'package:gest_life/core/constants/sizes.dart';
import 'package:gest_life/core/components/CosmeticOutlineButton.dart';
import 'package:gest_life/ui/LoginWidget.dart';
import 'package:gest_life/ui/SignUpWidget.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(cosmeticDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: const AssetImage(
                  cosmeticHomeImage,
                ),
                height: deviceHeight * 0.6,
              ),
              Column(
                children: [
                  Text(
                    'GestaLife',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Acompanhando vidas.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CosmeticOutlinedButton(
                      buttonName: 'ENTRE',
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginWidget(),
                          ),
                        )
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: CosmeticElevatedButton(
                      buttonName: 'CADASTRE-SE',
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpWidget(),
                          ),
                        )
                      },
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
