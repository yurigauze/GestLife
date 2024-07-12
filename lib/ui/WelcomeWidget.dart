
import 'package:flutter/material.dart';
import 'package:gest_life/core/constants/colors.dart';
import 'package:gest_life/core/constants/imagePath.dart';
import 'package:gest_life/core/constants/sizes.dart';
import 'package:gest_life/core/components/CosmeticOutlineButton.dart';
import 'package:gest_life/ui/LoginWidget.dart';


class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                cosmeticHomeImage,
              ),
              height: deviceHeight * 0.6,
            ),
            Column(
              children: [
                Text(
                  'Cosmetic Survey',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Gerenciando sonhos.',
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
              ],
            )
          ],
        ),
      ),
    );
  }
}

