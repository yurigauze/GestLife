import 'package:flutter/material.dart';
import 'package:gest_life/core/constants/colors.dart';

class CosmeticTextFormField extends StatelessWidget {
  String inputText;
  Icon icon;
  TextInputType keyboardType;
  String? initialValue;
  double borderRadius;
  FormFieldValidator? validator;
  TextEditingController? controller;
  TextInputAction? textInputAction;
  bool readOnly;
  int? maxLengh;
  TextCapitalization? textCapitalization;

  CosmeticTextFormField({
    Key? key,
    required this.inputText,
    required this.icon,
    required this.keyboardType,
    required this.borderRadius,
    required this.readOnly,
    this.validator,
    this.initialValue,
    this.controller,
    this.textInputAction,
    this.maxLengh,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      maxLength: maxLengh,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
        label: Text(inputText),
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        labelStyle: const TextStyle(
          color: cosmeticSecondaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            width: 2.0,
            color: cosmeticSecondaryColor,
          ),
        ),
      ),
    );
  }
}
