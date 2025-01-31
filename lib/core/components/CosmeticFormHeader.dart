import 'package:flutter/material.dart';

class CosmeticFormHeaderWidget extends StatelessWidget {
  String image, tittle, subtittle;
  TextStyle? textStyleTittle, textStyleSubTittle;
  CrossAxisAlignment crossAxisAlignment;
  double? heightBetween;
  TextAlign? textAlign;

  CosmeticFormHeaderWidget({
    Key? key,
    required this.image,
    required this.tittle,
    required this.subtittle,
    this.textStyleTittle,
    this.textStyleSubTittle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.heightBetween,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: deviceSize.height * 0.4,
        ),
        SizedBox(height: heightBetween),
        Text(
          tittle,
        ),
        Text(
          subtittle,
          textAlign: textAlign,
        ),
      ],
    );
  }
}
