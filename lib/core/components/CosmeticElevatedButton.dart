import 'package:flutter/material.dart';
import 'package:gest_life/core/constants/colors.dart';
import 'package:gest_life/core/constants/sizes.dart';

class CosmeticElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  String buttonName;

  CosmeticElevatedButton(
      {Key? key, required this.buttonName, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: cosmeticSecondaryColor,
        backgroundColor: cosmeticPrimaryColor,
        side: const BorderSide(
          color: cosmeticPrimaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: cosmeticButtonHeight,
        ),
      ),
      child: Text(
        buttonName,
      ),
    );
  }
}
