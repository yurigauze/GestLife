import 'package:flutter/material.dart';
import 'package:gest_life/core/constants/sizes.dart';

class CosmeticOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  String buttonName;

  CosmeticOutlinedButton(
      {Key? key, required this.buttonName, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
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
