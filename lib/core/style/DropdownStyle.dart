import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class DropdownStyle {
  static InputDecoration dropdownStyle({required String label}) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          width: 2.0,
        ),
      ),
    );
  }
}
