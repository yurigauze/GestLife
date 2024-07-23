import 'package:flutter/material.dart';
import 'package:gest_life/core/constants/colors.dart';

class CosmeticPasswordFormField extends StatefulWidget {
  String inputText;
  Icon icon;
  String? initialValue;
  double borderRadius;
  FormFieldValidator validator;
  TextEditingController? controller;
  TextInputAction? textInputAction;
  int? maxLength;
  bool? disabled;

  CosmeticPasswordFormField({
    Key? key,
    required this.inputText,
    required this.icon,
    required this.borderRadius,
    required this.validator,
    this.initialValue,
    this.disabled,
    this.controller,
    this.textInputAction,
    this.maxLength,
  }) : super(key: key);

  @override
  State<CosmeticPasswordFormField> createState() =>
      _CosmeticPasswordFormField();
}

class _CosmeticPasswordFormField extends State<CosmeticPasswordFormField> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      initialValue: widget.initialValue,
      keyboardType: TextInputType.visiblePassword,
      validator: widget.validator,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        label: Text(
          widget.inputText,
        ),
        prefixIcon: widget.icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            width: 2.0,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(
              () {
                _hidePassword = !_hidePassword;
              },
            );
          },
        ),
      ),
      obscureText: _hidePassword,
    );
  }
}
