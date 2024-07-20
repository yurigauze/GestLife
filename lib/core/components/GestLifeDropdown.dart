import 'package:flutter/material.dart';

class GestLifeDropdown extends StatefulWidget {
  @override
  _GestLifeDropdownState createState() => _GestLifeDropdownState();
}

class _GestLifeDropdownState extends State<GestLifeDropdown> {
  String? _selectedValue;
  List<String> listOfValue = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      hint: Text('choose one'),
      isExpanded: true,
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
      onSaved: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "can't be empty";
        } else {
          return null;
        }
      },
      items: listOfValue.map((String val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Text(val),
        );
      }).toList(),
    );
  }
}
